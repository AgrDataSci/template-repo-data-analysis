<!-- badges: start -->
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/deed.en) 
<!-- badges: end --> 

## Template for project-oriented and FAIR data analysis workflows

This is a generic template to allow scientists in using a well structured data workflow following the project-oriented approach and findable accessible interoperable and reusable (FAIR) principles for data and code publication in science.

Suggestions/comments on this template or for new templates are welcome!

## Project-oriented workflow

Why we use project-oriented workflow? Here is the answer (https://www.tidyverse.org/blog/2017/12/workflow-vs-script/). From these recommendations the only thing that I think we can skip is using the package "here". 

## FAIR principles

In 2016, the ‘FAIR Guiding Principles for scientific data management and stewardship’ were published in Scientific Data. The authors intended to provide guidelines to improve the Findability, Accessibility, Interoperability, and Reuse of digital assets. The principles emphasise machine-actionability (i.e., the capacity of computational systems to find, access, interoperate, and reuse data with none or minimal human intervention) because humans increasingly rely on computational support to deal with data as a result of the increase in volume, complexity, and creation speed of data. Read more here https://www.go-fair.org/fair-principles/

## Metadata

The metadata/ folder contains structured metadata files that support the FAIR principles for scientific data and software publication. These files are designed to ensure reproducibility, transparency, and proper attribution in open science workflows. The folder structure is interoperable with [Zenodo](https://zenodo.org) for data publication. Please edit as you like and use the R script in the script/ folder to generate a .json file that you be parsed by Zenodo once you link your repository for publication. 


