---
title: Barriers of Urban Mobility
author: Gergő Pintér^1^ and Balázs Lengyel^1,2,3^
#date: "pintergreg.github.io/ccs24/short"
institute: >-
    ^1^ANETI Lab, Corvinus University of Budapest<br>
    ^2^ANETI Lab, HUN-REN Center for Economic and Regional Sciences<br>
    ^3^Institute for Data Analytics and Information Systems, Corvinus University of Budapest

title-slide-attributes:
    data-background-color: "#181d37"
    data-background-image: assets/corvinus_and_aneti.svg
    data-background-size: 23vw
    data-background-position: 1.25rem calc(100% - 1.25rem)
    data-conference-logo: hidden
slideNumber: "true"
showSlideNumber: "print"
revealjs-url: "assets/reveal.js-5.1.0/"
---

# motivation

:::::::::::::: {.columns}
::::::::: {.column width="30%"}
:::::: {.r-stack}
::: {}
![](figures/route_connect.png)
:::
::: {.fragment data-fragment-index=1}
![](figures/route_connect_and_divide_marker.png)
:::
::::::
:::::::::
::::::::: {.column width="80%"}
::: {.fragment data-fragment-index=1}
![Nagykőrösi road, Budapest<br/>by [vst](https://www.mapillary.com/app/user/vst) via [Mapillary](https://www.mapillary.com/app/?lat=47.45252492224&lng=19.11784766168&z=17&pKey=1294650608077501&focus=photo) [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)](figures/vst_1294650608077501_20230915_cropped.jpg)
:::
:::::::::
::::::::::::::

::: notes
- So in a sense, a road has a power to bring places closer to each other.
- Maybe not in a way as an Eintein-Rosen bridge; blending the space.
- But at the same time, a road can have an orthogonal effect: separating places, thus separating people.
- The photo show a multilane road to illustrate my point.
- This particular road separates two neighborhood. I guess I can safely say that people do not really cross this unless they really have to.
- The duality of the transportation infrastructure is motivated out work.
:::


# mobile positioning data

:::::::::::::: {.columns}
::: {.column width="55%"}
![](figures/pings_stops.png){height=375}

:::
::: {.column width="45%" .text-smallerx .mt-3}
- collected from various, unspecified smartphone apps
    - timestamp, user ID, location
    - GPS-based location
- pings are clustered into stops [@juhasz2023amenity]
    - using [Infostop](https://github.com/ulfaslak/infostop) algorithm [@aslak2020infostop]
    - where some time was spent
:::
::::::::::::::

::: notes
- we have the mobility data collected and aggregated from various and unknown smartphone applications
- a record has a timestamp, a user ID and GPS location
- we have two years of data for the whole country
:::


## building a network

:::::::::::::: {.columns}
::: {.column width="50%"}
![the blocks are considered nodes](figures/stops_to_blocks.png)
:::
::: {.column width="50%"}
![connected if a user had consecutive stops in two blocks within a day](figures/blocks_network_real_pos.png)
:::
::::::::::::::


# community detection

:::::::::::::: {.columns}
:::::: {.column .center-content width="55%"}
- using the network built from the stops
- Louvain community detection is applied
    - with different resolution values
    - executed 10 times for each resolution
::::::
:::::: {.column width="45%"}
![Louvain communities<br/>(resolution 2.5)](figures/network_v2.png)
::::::
::::::::::::::


## Louvain community detection - resolution 2.5

:::::::::::::: {.columns}
:::::: {.column width="40%"}
![infrastructural barriers: primary and secondary (dotted) roads](figures/louvain_resolution2.5_two_level_barriers.png)
::::::
:::::: {.column width="40%" .fragment}
![administrative boundaries:<br/>districts and neighborhood (dotted)](figures/louvain_resolution2.5_two_level_districts.png)
::::::
::::::::::::::


# barrier crossing ratio

::::::::::::::: {.columns}
:::::::::::: {.column width="50%"}
::::::::: {.r-stack}
:::::: {}
![](figures/barrier_and_community_crossing_1.png)
::::::
:::::: {.fragment data-fragment-index=1}
![](figures/barrier_and_community_crossing_2.png)
::::::
:::::: {.fragment data-fragment-index=2}
![](figures/barrier_and_community_crossing_3.png)
::::::
:::::::::
::::::::::::
:::::::::::: {.column width="50%"}
::::::::: {.r-stack}
:::::: {.fragment data-fragment-index=7 .current-visible}
\\[ BCR_{\gamma}^{barrier} = \dfrac{1}{n} \frac{ \sum_{m} \text{{CB}} }{ \sum_{m} \text{{CB}} \times \text{{CC}}_{\gamma} } \\]

::: {.text-smaller}
- *m* is the number of mobility edges
- $\gamma$ is the resolution
- *n* is the number of iterations at resolution $\gamma$
:::

by barrier types:

::: {.text-smaller}
- district
- neighborhood
- primary roads
- secondary
- railways
- river
:::
::::::
:::::::::
::::::::::::
:::::::::::::::

::: notes
:::


## BCR by barrier types

![](figures/crossing_ratio.png){width=500}

## classify users based on home location

trips within Budapest are considered

::: {.fragment data-fragment-index=3}
but the classification is not restricted to Budapest
:::

:::::: {.r-stack}
::: { .mt-5 .current-visible}
![](figures/trips.drawio.png){width=400}
:::
::: {.fragment data-fragment-index=3 .mt-5 .current-visible}
![](figures/trips_and_homes.drawio.png){width=400}
:::
::::::


## decomposing barrier crossing ratio

:::::::::::::: {.columns}
:::::: {.column width="30%"}
![](figures/map_with_legend_diverging.png)

::::::
:::::: {.column width="70%" .fragment}
![](figures/bcr_orig_comm_diverging.png)

::::::
::::::::::::::


## decomposing barrier crossing ratio {visibility=hidden}

:::::::::::::: {.columns}
:::::: {.column width="30%"}
![](figures/map_with_legend.png)

::::::
:::::: {.column width="70%"}
![](figures/bcr_orig_comm.png)

::::::
::::::::::::::


# thanks for the attention! {background-color="#181d37" .text-color-white background-image="assets/by.svg" background-size="10vw" background-position="1.25rem calc(100% - 1.25rem)" .light-slide-number}

::: {.text-color-white}
Gergő Pintér, <span class="text-color-lightblue">gergo.pinter&ThinSpace;&#64;&ThinSpace;uni-corvinus.hu</span>, \@pintergreg[![](assets/twitter.svg){.svg-invert}](https://twitter.com/pintergreg) [![](assets/github.svg){.svg-invert}](https://github.com/pintergreg) [![](assets/bluesky.svg){.svg-invert}](https://bsky.app/profile/pintergreg.bsky.social)
:::

::::::::::::::: {.columns}
:::::::::::: {.column width="50%"}
this presentation is available online: [[pintergreg.github.io/ccs24/short](https://pintergreg.github.io/ccs24/short)]{.text-size-2 .anchor-color-lightblue}

:::::: {.mt-5}
references

::: {#refs .text-size-1}
:::

::::::

::::::::::::
:::::::::::: {.column width="45%"}
already available on arXiv:<br>[[2312.11343](https://arxiv.org/abs/2312.11343)]{.anchor-color-lightblue}

[![](assets/arxiv_qr_code.png){width=350}](https://arxiv.org/abs/2312.11343)

::::::::::::
:::::::::::::::
