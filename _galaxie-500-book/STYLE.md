# Galaxie 500 zine — style guide

Living document — extend as new conventions get decided.

## Dates

- Format: ordinal day, full month, full year — e.g. `17th May 1964`
- Placement: italicised, directly under the entry heading
- Markdown: `_17th May 1964_`

## Titles

- **Albums, EPs, box sets, and other multi-track releases** — italics
  - `_Today_`, `_On Fire_`, `_This Is Our Music_`, `_Uncollected Noise New York '88–'90_`, `_The Portable Galaxie 500_`
- **Songs / individual tracks** — quotation marks
  - `"Tugboat"`, `"Blue Thunder"`
- **Singles/7"s sharing a title with a song** — treat as a song, quotation marks
  - `"Snowstorm/Pictures"`
- **Italics syntax** — always use underscores (`_like this_`), not asterisks. Consistency matters more than which one.
- **Quotation marks** — write straight quotes in source; Pandoc's `smart` extension converts to typographic quotes at the LaTeX stage. Don't hand-type curly quotes.

## Section headings & official catalogue numbers

- Section heading format: `## <Release name> (<catalogue number>, <month year>)`
  - e.g. `## Aurora (AU 002, October 1988)`
- This is the *official* label catalogue number, identifying the release itself — not to be confused with your own AHFOW collection numbering, which lives in the metadata block instead (see below)

## Metadata block

Sits at the end of each entry. Has changed a lot across 3+ years of posts —
this is the converged version going forward; older entries should be
reformatted to match as they're compiled into the zine.

- Field labels in **bold**, not italics (italics is reserved for dates, so this keeps the two visually distinct)
- Fields, in order:
  - **AHFOW Number:** — your own collection cataloguing number (e.g. `AHFOW 12/032`). Deliberately *not* called "Catalogue Number" to avoid clashing with the official catalogue number already given in the section heading
  - **Artist:**
  - **Title:**
  - **Format:** — LP, CD, cassette, 7", flexi, etc.
  - **Acquisition:** — freeform note on how/when/where it was bought. Always give this its own labelled line rather than leaving it as loose trailing prose
  - **Notes:** — optional; only include when there's something genuinely extra to say that isn't already covered by the heading (release name/label/date) or the Format field. Drop it rather than let it restate the heading (e.g. don't write "Aurora LP" here when the heading already says Aurora and Format already says LP)

Example:

```markdown
## Aurora (AU 002, October 1988)

_17th May 1964_

- **AHFOW Number:** AHFOW 12/032
- **Artist:** Galaxie 500
- **Title:** Today
- **Format:** LP
- **Acquisition:** Bought on eBay around 2010, for a lot less than they go for now — exact price lost to time
```

## Links

Print can't follow links, so every link needs a decision at compile time:

- **Genuinely useful reference** (Discogs listing, interview, source for a claim) — convert to a footnote
- **Incidental link** (casual mention, no real reference value) — just drop the link syntax, keep the italics/quotes on the title
  - `[_Today_](url)` → `_Today_`

## Footnotes

- Use Pandoc's native syntax: `[^label]` marker, `[^label]: definition` at the bottom of the file
- **Labels are descriptive, not numbered** — stable under reordering, and Pandoc auto-numbers the rendered output regardless
  - Pattern: `[^type-source-date]`, e.g. `[^email-2025-08-22]`, `[^discogs-listing]`, `[^blog-2019-03-tugboat]`
  - Labels never appear to the reader — free to make them as personally meaningful as helpful
  - No spaces in labels; must be unique per document (deliberate reuse to share one definition is fine)
- Placeholder footnotes still needing research: `[^label]: TODO — <what's needed>`
  - Grep-able via: `grep -rn "TODO —" .`

## Images

- Placeholder convention for images still needing a higher-res source — TBD, currently being removed and flagged inline as work proceeds

## Cross-references

- References to "the earlier post" / "as mentioned last time" from the original blog run may no longer point at the right neighbour once reordered into release order — check and update or cut on a per-chapter pass
- Dated, personal asides ("still hunting for this one," collecting-journey commentary) can stay as-is — these read as intentional voice/texture, not navigation, especially now dates are being restored
- Consider a one-line editorial note at the start of a merged chapter noting entries were written over time, not in the order presented, to frame any remaining chronological quirks as deliberate

## General workflow notes

- Compile and edit in markdown first; only convert via Pandoc once a chapter is stable — don't mix content editing and LaTeX layout work
- Custom Jekyll shortcodes/plugins from the original posts need manual stripping/converting to plain text or images regardless of destination format
