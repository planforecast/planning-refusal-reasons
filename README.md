# Why English councils refuse planning permission

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23327502.svg)](https://doi.org/10.5281/zenodo.23327502)

Counts of planning decisions and of the reasons councils gave for refusing them, by council and kind of work, for English local planning authorities. Published by [Plan Forecast](https://planforecast.co.uk).

- **Source and latest figures:** <https://planforecast.co.uk/data>
- **How the figures are counted:** <https://planforecast.co.uk/how-it-works>
- **Licence:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- **This snapshot:** 12 October 2026
- **DOI:** [10.5281/zenodo.23327502](https://doi.org/10.5281/zenodo.23327502)

Every figure is counted from decisions the councils publish on their own planning registers, and from the decision notices they publish with each refusal.

## What is in it

| File | Rows | One row is |
| --- | --- | --- |
| [`data/refusal-reasons.csv`](data/refusal-reasons.csv) | 376 | a council, a kind of work and a topic: how many refusals gave a reason about that topic |
| [`data/decisions.csv`](data/decisions.csv) | 80 | a council and a kind of work: decisions, how many were granted, and the dates covered |

This snapshot covers 89,096 decisions in eight councils, and 3,958 refusals in seven of them, 3,827 of whose decision notices were read.

Councils: Cheshire West and Chester, Leeds, North Yorkshire, Salford, Stockport, Trafford, Wakefield (decisions only) and York. More are added as their registers are read.

## What is deliberately not in it

Counts only. No application reference, no address, no postcode, no coordinates, no proposal text, none of a council's own wording, and no person's name. Plan Forecast does not store the names of applicants, agents, case officers or objectors anywhere.

## `refusal-reasons.csv`

| Column | Type | Meaning |
| --- | --- | --- |
| `lpa_name` | text | The local planning authority |
| `lpa_ons_code` | text | Its ONS code, for joining to other data (`E06000065`) |
| `proposal_type` | text | The kind of work (below), or `all` for every kind together, each refusal counted once |
| `refusals` | integer | Refusals of that kind of work in the window |
| `refusals_read` | integer | Of those, the refusals whose decision notice was read |
| `topic` | text | What a reason was about (below) |
| `refusals_citing_topic` | integer | Of the refusals read, how many gave at least one reason about this topic |
| `window_months` | integer | How many months back the counts reach (36, or fewer where a council's register has been read for less) |

How to read it:

- A refusal usually gives several reasons, so a council's topics add up to more than its refusals read. The share of refusals citing a topic is `refusals_citing_topic / refusals_read`.
- A refusal whose notice was not read is counted as a refusal, never as a refusal without reasons.
- A council and kind of work appear only where at least 30 refusals, and at least half of them, were read.
- The topic is Plan Forecast's sorting of the council's reason. The reasons were cut from the notices and sorted into topics by software, and the sorting is checked against a person's.

Topics:

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

## `decisions.csv`

| Column | Type | Meaning |
| --- | --- | --- |
| `lpa_name` | text | The local planning authority |
| `lpa_ons_code` | text | Its ONS code |
| `proposal_type` | text | The kind of work (below), or `all` for every decision read from the council's register |
| `decisions` | integer | For a kind of work, decisions granted or refused. For `all`, every decision |
| `granted` | integer | Decisions granted. Empty on an `all` row and where the rate is withheld |
| `grant_rate` | number | Granted divided by granted plus refused. Withdrawn applications are never counted as refusals. Empty where withheld |
| `indicative` | boolean | `true` where the rate rests on 10 to 29 decisions: a small sample |
| `window_start` | date | The earliest decision counted |
| `window_end` | date | The latest decision counted |

An empty `grant_rate` means "too few to say" (under ten decisions), not zero.

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

## Example

```python
import pandas as pd

reasons = pd.read_csv("data/refusal-reasons.csv")
reasons["share"] = reasons["refusals_citing_topic"] / reasons["refusals_read"]

# What gets a rear extension refused, council by council
rear = reasons[reasons["proposal_type"] == "rear_extension"]
print(rear.pivot(index="topic", columns="lpa_name", values="share").round(2))
```

## Updates

The figures on [planforecast.co.uk/data](https://planforecast.co.uk/data) are generated from the live counts and change daily. This copy is a dated snapshot; each release here is a new snapshot. `./update.sh` refreshes the files from the site.

## Where else it is published

The same files, each linking back to [planforecast.co.uk/data](https://planforecast.co.uk/data):

- **Zenodo:** <https://doi.org/10.5281/zenodo.23327502>
- **Kaggle:** <https://www.kaggle.com/datasets/planforecast/why-english-councils-refuse-planning-permission>
- **Hugging Face:** <https://huggingface.co/datasets/planforecast/planning-refusal-reasons>

## How to cite

> Plan Forecast (2026). Why English councils refuse planning permission: decisions and refusal reasons by council and kind of work. Zenodo. https://doi.org/10.5281/zenodo.23327502. Source: https://planforecast.co.uk/data

That DOI always resolves to the latest snapshot; each snapshot also has a DOI of its own, listed on the Zenodo record.

Attribution, where you reuse the figures:

> Planning decision figures by Plan Forecast (planforecast.co.uk), counted from local planning authorities' own public registers.

## Licence

[Creative Commons Attribution 4.0 International](LICENSE). Copy, publish, adapt and use these figures, including commercially, provided you attribute them. The underlying records remain each authority's own and are published on their registers.

Something wrong, or something that should not be published? [Tell us](https://planforecast.co.uk/takedown).
