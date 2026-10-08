"""Build Paper Term from a Paper Mono release.

Usage:
    pip install fonttools
    python scripts/build.py path/to/paper-mono/fonts/otf fonts/otf

What it changes, per weight:
  - cv01 (single-story a) and zero (slashed zero) become the default glyphs,
    by pointing the cmap at the alternate glyphs.
  - ss01 (coding ligatures) is folded into calt, so it is on by default
    wherever the renderer applies contextual alternates.
  - The family is renamed from "Paper Mono" to "Paper Term", as the
    SIL Open Font License asks of modified versions.
"""
import pathlib
import sys

from fontTools.ttLib import TTFont

BAKED_SINGLE_SUBS = ("cv01", "zero")
FOLDED_INTO_CALT = ("ss01",)


def rename(s):
    return s.replace("Paper Mono", "Paper Term").replace("PaperMono", "PaperTerm")


def build(src, dst):
    font = TTFont(src)
    gsub = font["GSUB"].table
    feats = {fr.FeatureTag: fr.Feature for fr in gsub.FeatureList.FeatureRecord}

    swap = {}
    for tag in BAKED_SINGLE_SUBS:
        for li in feats[tag].LookupListIndex:
            for st in gsub.LookupList.Lookup[li].SubTable:
                swap.update(st.mapping)
    for table in font["cmap"].tables:
        for cp, glyph in list(table.cmap.items()):
            if glyph in swap:
                table.cmap[cp] = swap[glyph]

    calt = feats["calt"]
    lookups = set(calt.LookupListIndex)
    for tag in FOLDED_INTO_CALT:
        lookups |= set(feats[tag].LookupListIndex)
    calt.LookupListIndex = sorted(lookups)
    calt.LookupCount = len(calt.LookupListIndex)

    for rec in font["name"].names:
        rec.string = rename(rec.toUnicode())
    if "CFF " in font:
        cff = font["CFF "].cff
        cff.fontNames = [rename(n) for n in cff.fontNames]
        top = cff.topDictIndex[0]
        for key in ("FullName", "FamilyName"):
            if hasattr(top, key):
                setattr(top, key, rename(getattr(top, key)))

    font.save(dst)


def main():
    src_dir, out_dir = map(pathlib.Path, sys.argv[1:3])
    out_dir.mkdir(parents=True, exist_ok=True)
    for src in sorted(src_dir.glob("PaperMono-*.otf")):
        dst = out_dir / rename(src.name)
        build(src, dst)
        print(dst)


if __name__ == "__main__":
    main()
