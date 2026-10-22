# The Plan Forecast Planning Decisions Report

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23327502.svg)](https://doi.org/10.5281/zenodo.23327502)

Planning decisions, decision times and the reasons councils gave for refusing applications, by council and kind of work, for the English councils Plan Forecast reads. The data of [The Plan Forecast Planning Decisions Report](https://planforecast.co.uk/research/planning-decisions), published monthly by [Plan Forecast](https://planforecast.co.uk); each edition is frozen, and is a version of the same DOI.

- **This edition:** October 2026, published 22 October 2026: [the report](https://planforecast.co.uk/research/planning-decisions/2026-10)
- **Window:** decisions from October 2023 to September 2026, narrowed for a council read over less (its `window_start`)
- **Councils:** Cheshire West and Chester, Ealing, Leeds, North Yorkshire, Salford, Stockport, Trafford, Wakefield and York
- **Licence:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- **DOI:** [10.5281/zenodo.23327502](https://doi.org/10.5281/zenodo.23327502) (every edition; each has a DOI of its own on the Zenodo record)

## Key findings

- Across the 9 councils we read, 89% of the 30,802 householder planning applications decided in the 36 months to September 2026 (for Ealing, since March 2025; for Wakefield, since June 2025) were approved (Plan Forecast, Planning Decisions Report, October 2026 edition).
- Across the 9 councils we read, half of the 30,798 householder planning applications decided in the 36 months to September 2026 (for Ealing, since March 2025; for Wakefield, since June 2025) were decided within 55 days, and three quarters within 69 days (Plan Forecast, Planning Decisions Report, October 2026 edition).
- Of the 9 councils we read, Wakefield approved the highest share of householder planning applications: 96% of the 889 it decided from June 2025 to September 2026 (Plan Forecast, Planning Decisions Report, October 2026 edition).

## What is in it

| File | Rows | One row is |
| --- | --- | --- |
| [`data/decisions.csv`](data/decisions.csv) | 100 | a council and a kind of work (or householder work together): decisions, granted, refused, the share approved and days to decide |
| [`data/refusal-reasons.csv`](data/refusal-reasons.csv) | 123 | a council and a topic: how many of its refusals read gave a reason about it |

Rows with `scope` `councils` are every council together. Each file names its `edition`.

## What is deliberately not in it

Counts only. No application reference, address, postcode, coordinates, proposal text, council wording or person's name. Plan Forecast stores no name of an applicant, agent, case officer or objector anywhere.

## `decisions.csv`

| Column | Meaning |
| --- | --- |
| `edition` | The edition, `yyyy-mm` |
| `scope` | `council`, or `councils` for every council together |
| `lpa_name`, `lpa_ons_code` | The local planning authority and its ONS code (empty for `councils`) |
| `proposal_type` | `householder` (the first seven kinds together) or a kind of work (below) |
| `window_start`, `window_end` | The days counted |
| `decisions` | Every decision counted, whatever its outcome |
| `granted`, `refused`, `withdrawn` | By outcome |
| `approved_percent` | Granted of granted and refused, rounded; empty where `held_back` |
| `approved_low_percent`, `approved_high_percent` | Its 95% Wilson interval |
| `timed` | Granted and refused with sound dates: what the days rest on |
| `p25_days`, `median_days`, `p75_days` | Days from validation (or receipt) to decision: each a day some decision took; empty where fewer than 30 were timed |
| `held_back` | `true` where fewer than 30 were granted or refused, so the share approved is empty; `decisions` counts withdrawals too |

Kinds of work:

| `proposal_type` | Meaning |
| --- | --- |
| `rear_extension` | Rear extension |
| `side_extension` | Side extension |
| `two_storey_extension` | Two-storey extension |
| `loft_dormer` | Loft conversion or dormer |
| `outbuilding` | Garden room or outbuilding |
| `garage_conversion` | Garage conversion |
| `porch_front` | Front porch |
| `new_dwelling_garden` | New dwelling in a garden |
| `change_of_use` | Change of use |

## `refusal-reasons.csv`

| Column | Meaning |
| --- | --- |
| `edition`, `scope`, `lpa_name`, `lpa_ons_code`, `window_start`, `window_end` | As above |
| `refusals` | Refusals in the window |
| `refusals_read` | Of those, the refusals whose decision notice was read |
| `topic` | What a reason was about (below) |
| `refusals_citing_topic` | Of the refusals read, how many gave at least one reason about this topic |
| `share_percent` | That, of the refusals read |

A council appears only where at least 30 of its refusals, and half of them, were read. A refusal usually gives several reasons, so the shares add up to more than 100.

| `topic` | Meaning |
| --- | --- |
| `design_character` | Design and character of the area |
| `residential_amenity` | Neighbours' amenity |
| `highway_parking` | Highways and parking |
| `heritage` | Heritage assets |
| `green_belt_open_countryside` | Green Belt and open countryside |
| `trees_landscape_ecology` | Trees, landscape and ecology |
| `flood_drainage` | Flooding and drainage |
| `principle_of_development` | Principle of development |
| `permitted_development` | Not permitted development |
| `living_conditions_future_occupiers` | Living conditions for future occupiers |
| `neighbouring_land_use_conflict` | Conflict with neighbouring land uses |
| `insufficient_information` | Insufficient information |
| `other` | Other |

## Updates

A new edition on the first of each month, released here by Plan Forecast's own machine: the files, this README and a GitHub release, from which Zenodo makes a new version of the DOI. Earlier editions stay on the Zenodo record and at their own addresses on the site.

## How to cite

> Plan Forecast (2026). The Plan Forecast Planning Decisions Report, October 2026 edition. https://planforecast.co.uk/research/planning-decisions/2026-10. https://doi.org/10.5281/zenodo.23327502

Attribution, where you reuse the figures:

> Planning decision figures by Plan Forecast (planforecast.co.uk), counted from local planning authorities' own public registers.

## Where else it is published

- **The report:** <https://planforecast.co.uk/research/planning-decisions/2026-10>
- **Zenodo:** <https://doi.org/10.5281/zenodo.23327502>
- **GitHub:** <https://github.com/planforecast/planning-refusal-reasons>
- **Kaggle:** <https://www.kaggle.com/datasets/planforecast/why-english-councils-refuse-planning-permission>
- **Hugging Face:** <https://huggingface.co/datasets/planforecast/planning-refusal-reasons>

## Licence

[Creative Commons Attribution 4.0 International](LICENSE). Copy, publish, adapt and use these figures, including commercially, provided you attribute them. The underlying records remain each authority's own and are published on their registers.

Something wrong, or something that should not be published? [Tell us](https://planforecast.co.uk/takedown).
