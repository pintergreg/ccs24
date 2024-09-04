---
title: Barriers of Urban Mobility
author: Gergő Pintér^1^ and Balázs Lengyel^1,2,3^
date: "5 September 2024<br>pintergreg.github.io/ccs24"
institute: >-
    ^1^ANETI Lab, Corvinus University of Budapest<br>
    ^2^ANETI Lab, HUN-REN Center for Economic and Regional Sciences<br>
    ^3^Institute for Data Analytics and Information Systems, Corvinus University of Budapest

title-slide-attributes:
    data-background-color: "#181d37"
    data-background-image: assets/corvinus_and_aneti.svg
    data-background-size: 23vw
    data-background-position: 1.25rem calc(100% - 1.25rem)
slideNumber: "true"
showSlideNumber: "print"
revealjs-url: "assets/reveal.js-5.1.0/"
---

# {visibility=hidden}
::: {.r-fit-text}
all roads lead to Rome
:::

::: notes
- if we take that literately and kinda reverse it, we get that the roads lead where the romans wanted to go
- my point is, roads are built to connect places
:::


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

<!-- - transportation infrastructure are built to connect places -->
<!-- - but the elements of this infrastructure can also separate neighborhoods -->
<!-- - especially if it is a wide, multilane road -->
<!-- - we can consider a road as a connecting and a separating element of the fabric of a city -->
<!-- - as if two orthogonal forces act regarding a road -->
:::


## amenities enter the equation

:::::::::::::: {.columns}
::::::::: {.column width="50%"}
:::::: {.r-stack}
::: {}
![](figures/route_connect_and_divide.png){width=350}

:::
::: {.fragment data-fragment-index=1}
![](figures/amenity_attracts.png){width=350}

:::
::::::
:::::::::
::::::::: {.column width="50%" .mt-5}
- complex amenities foster social mixing [@juhasz2023amenity]
- complex as in economic complexity
- still working combining the two branches of research
:::::::::
::::::::::::::


::: notes
- I'm not gonna lie, the equation is not complete; amenities also influence the mobility
- amenities attract people and that attraction force could be strong enough to make people overcome any barriers
- for example, the workplace or an amenity with unique behavior
    - in an earlier work, we defined that uniqueness as complexity applying economic complexity to the urban mobility setting and also found that complex amenities foster social mixing
:::


## motivation {visibility=hidden}

:::::::::::::: {.columns}
::: {.column width="67%"}
![A wildlife overpass built over Highway 38 in Israel<br/>[by Hagai Agmon-Snir](https://commons.wikimedia.org/wiki/File:WildlifeCrossingRoad38IsraelOct092022_02.jpg) | [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)](figures/WildlifeCrossingRoad38IsraelOct092022_02.jpg){width=750}
:::
::::::::::::::

::: notes
- I like this photo, not just because it is beautiful, catchy to the eye, but because of the kindness of concept.
    - building 
- the barrier effect, the separating force 
- some bridges are built solely for the wildlife to overcome this issue
- in an urban scenario, even a crosswalk, especially with traffic lamps could help
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


## decomposing barrier crossing ratio

:::::::::::::: {.columns}
:::::: {.column width="30%"}
![](figures/map_with_legend.png)

::::::
:::::: {.column width="70%"}
![](figures/bcr_orig_comm.png)

::::::
::::::::::::::

## back to amenities

::: {}
$$ log BCR_{\gamma, n}^{c} = \alpha + \beta_1\log{D_c} + \beta_2\log{AC_j} + \epsilon $$

::: {.text-smaller}
$AC_j$ complexity of amenity portfolio of the visited $j$ location as proposed by [@juhasz2023amenity]

:::
:::

![](figures/ibcr_avg_visitation_complexity.png){width=600}


# Nagoya metropolitan area

:::::::::::::: {.columns}
:::::: {.column width="50%"}
![municipality boundaries<br>wards (dotted)](figures/nagoya_communities_res_5.png){width=335}
::::::
:::::: {.column width="50%" .fragment}
![higher order roads](figures/nagoya_communities_roads_res_5.png){width=335}
::::::
::::::::::::::

::: {.text-smaller}
open data (YJMob100K): [@yabe2024yjmob100k] | preprocessing (preprint): [@pinter2024revealing]
:::

::: notes
- I replicated this using another data set about the Nagoya metropolitan, which follows 100.000 people in a 100 km by 100 km metropolitan area
- we can see that Louvain communities align with the municipality boundaries pretty well, though sometimes multiple municipalities form a community just as we saw it in the case of Budapest
- what does not align at all is the road network, which is a huge difference between the Budapest and the Japanese results
:::


## BCR × Nagoya

![](figures/road1_bcr.png){width=650}

::: notes
- I also calculated the individual barrier crossing ratio for the Japanese data
- the trends are the same, but that's the less interesting
- I wanted to replicate the experiment distinguishing the people by residence, so I formed two categories, people having home in and out of Nagoya
- however, the barrier effect is just the opposite compared to Budapest regarding Nagoya dwellers and others
- it still needs more study to completely understand the reason of this; my educated guess is that the different transportation culture leads to the different community alignments, which cases the opposite relation in the BCR
:::


#

:::::::::::::: {.columns}
:::::: {.column width="50%"}
**takaway**

- there is a barrier effect 
- which affects people differently based on background

::::::
:::::: {.column width="50%"}
**future work**

- socio-economic status
- different time interval
    - workdays - weekends
    - time of the day

::::::
::::::::::::::


# thanks for the attention! {background-color="#181d37" .text-color-white background-image="assets/by.svg" background-size="10vw" background-position="1.25rem calc(100% - 1.25rem)" .light-slide-number}

::: {.text-color-white}
Gergő Pintér, <span class="text-color-lightblue">gergo.pinter&ThinSpace;&#64;&ThinSpace;uni-corvinus.hu</span>, \@pintergreg[![](assets/twitter.svg){.svg-invert}](https://twitter.com/pintergreg) [![](assets/github.svg){.svg-invert}](https://github.com/pintergreg) [![](assets/bluesky.svg){.svg-invert}](https://bsky.app/profile/pintergreg.bsky.social)
:::

::::::::::::::: {.columns}
:::::::::::: {.column width="50%"}
this presentation is available online: [[pintergreg.github.io/ccs24](https://pintergreg.github.io/ccs24)]{.text-size-2 .anchor-color-lightblue}

[![](assets/gh_discussions.png)](https://github.com/pintergreg/ccs24/discussions)

we are looking for contributors<br>with compatible data

::::::::::::
:::::::::::: {.column width="45%"}
already available on [[arXiv](https://arxiv.org/abs/2312.11343)]{.anchor-color-lightblue}:<br>2312.11343

[![](assets/arxiv_qr_code.png){width=350}](https://arxiv.org/abs/2312.11343)

::::::::::::
:::::::::::::::

# references {visibility=uncounted}

::: {#refs}
:::
