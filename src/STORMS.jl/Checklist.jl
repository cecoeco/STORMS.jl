using PlotlyJS
using Colors

const xMINIMUM_WIDTH::Int64 = 0
const xMAXIMUM_WIDTH::Int64 = 1200
const yMINIMUM_HEIGHT::Int64 = 0
const yMAXIMUM_HEIGHT::Int64 = 600

function checklist(
    transparent_bg::Bool=false,
    textsize::Number=6,
    textfont::AbstractString="Helvetica",
    textcolor="black",
    textalignment::Vector{String}=["left", "center"],
    fillcolor=RGB(1, 1, 1),
    linecolor=RGB(0, 0, 0),
    headertextsize::Number=6,
    headertextfont::AbstractString="Helvetica",
    headertextcolor="black",
    headertextalignment::Vector{String}=["left", "center"],
    headerfillcolor="RGB(0, 0, 1)",
    celltextsize::Number=6,
    celltextfont::AbstractString="Helvetica",
    celltextcolor="black",
    celltextalignment::Vector{String}=["left", "center"],
    cellfillcolor=RGB(1, 1, 1))

    plot(
        Layout(
            #width=xMAXIMUM_WIDTH,
            #height=yMAXIMUM_HEIGHT,
            xaxis=attr(
                range=[
                    xMINIMUM_WIDTH,
                    xMAXIMUM_WIDTH
                ],
                showgrid=false
            ),
            yaxis=attr(
                range=[
                    yMINIMUM_HEIGHT,
                    yMAXIMUM_HEIGHT
                ],
                showgrid=false
            ), plot_bgcolor=plot_bgcolor = transparent_bg ? RGBA(0, 0, 0, 0) : RGBA(1, 1, 1, 1)
        ),
        table(
            header=attr(
                line_color=linecolor,
                fill_color=  
                if !isempty(fillcolor) && !isempty(headerfillcolor)
                    headerfillcolor
                elseif !isempty(fillcolor) && isempty(headerfillcolor)
                    fillcolor
                elseif isempty(fillcolor) && !isempty(headerfillcolor)
                    headerfillcolor
                else
                    fillcolor
                end,
                align=
                if !isempty(textalignment) && !isempty(headertextalignment)
                    headertextalignment
                elseif !isempty(textalignment) && isempty(headertextalignment)
                    textalignment
                elseif isempty(textalignment) && !isempty(headertextalignment)
                    headertextalignment
                else
                    textalignment
                end,
                font=attr(
                    color=
                    if !isempty(textcolor) && !isempty(headertextcolor)
                        headertextcolor
                    elseif !isempty(textcolor) && isempty(headertextcolor)
                        textcolor
                    elseif isempty(textcolor) && !isempty(headertextcolor)
                        headertextcolor
                    else
                        textcolor
                    end,
                    font_family=
                    if !isempty(textfont) && !isempty(headertextfont)
                        headertextfont
                    elseif !isempty(textfont) && isempty(headertextfont)
                        textfont
                    elseif isempty(textfont) && !isempty(headertextfont)
                        headertextfont
                    else
                        textfont
                    end,
                    size=
                    if !isempty(textsize) && !isempty(headertextsize)
                        headertextsize
                    elseif !isempty(textsize) && isempty(headertextsize)
                        textsize
                    elseif isempty(textsize) && !isempty(headertextsize)
                        headertextsize
                    else
                        textsize
                    end
                ),
                values=[
                    "<b>Number</b>",
                    "<b>Item</b>",
                    "<b>Recommendation</b>",
                    "<b>Item Source</b>",
                    "<b>Additional Guidance</b>",
                    "<b>Yes/No/NA</b>",
                    "<b>Comments or location in manuscript</b>"
                ],
            ),
            cells=attr(
                line_color=linecolor,
                fill_color=
                if !isempty(fillcolor) && !isempty(cellfillcolor)
                    cellfillcolor
                elseif !isempty(fillcolor) && isempty(cellfillcolor)
                    fillcolor
                elseif isempty(fillcolor) && !isempty(cellfillcolor)
                    cellfillcolor
                else
                    fillcolor
                end,
                align=
                if !isempty(textalignment) && !isempty(celltextalignment)
                    celltextalignment
                elseif !isempty(textalignment) && isempty(celltextalignment)
                    textalignment
                elseif isempty(textalignment) && !isempty(celltextalignment)
                    celltextalignment
                else
                    textalignment
                end,
                font=attr(
                    color=
                    if !isempty(textcolor) && !isempty(celltextcolor)
                        celltextcolor
                    elseif !isempty(textcolor) && isempty(celltextcolor)
                        textcolor
                    elseif isempty(textcolor) && !isempty(celltextcolor)
                        celltextcolor
                    else
                        textcolor
                    end,
                    font_family=
                    if !isempty(textfont) && !isempty(celltextfont)
                        celltextfont
                    elseif !isempty(textfont) && isempty(celltextfont)
                        textfont
                    elseif isempty(textfont) && !isempty(celltextfont)
                        celltextfont
                    else
                        textfont
                    end,
                    size=
                    if !isempty(textsize) && !isempty(celltextsize)
                        celltextsize
                    elseif !isempty(textsize) && isempty(celltextsize)
                        textsize
                    elseif isempty(textsize) && !isempty(celltextsize)
                        celltextsize
                    else
                        textsize
                    end
                ),
                values=[
                    [   # NUMBER
                        "<b>Abstract</b>", 
                        "1.0", 
                        "1.1", 
                        "1.2", 
                        "1.3", 
                        "<b>Introduction</b>",
                        "2.0",
                        "2.1",
                        "<b>Methods</b>",
                        "3.0",
                        "3.1",
                        "3.2",
                        "3.3",
                        "3.4",
                        "3.5",
                        "3.6",
                        "3.7",
                        "3.8",
                        "3.9",
                        "4.0",
                        "4.1",
                        "4.2",
                        "4.3",
                        "4.4",
                        "4.5",
                        "4.6",
                        "4.7",
                        "4.8",
                        "4.9",
                        "4.10",
                        "4.11",
                        "4.12",
                        "4.13",
                        "4.14",
                        "4.15",
                        "4.16",
                        "5.0",
                        "6.0",
                        "6.1",
                        "7.0",
                        "7.1",
                        "7.2",
                        "7.3",
                        "7.4",
                        "7.5",
                        "7.6",
                        "7.7",
                        "7.8",
                        "7.9",
                        "8.0",
                        "8.1",
                        "8.2",
                        "8.3",
                        "8.4",
                        "8.5",
                        "<b>Results</b>",
                        "9.0",
                        "10.0",
                        "10.1",
                        "10.2",
                        "10.3",
                        "10.4",
                        "<b>Discussion</b>",
                        "11.0",
                        "12.0",
                        "13.0",
                        "13.1",
                        "13.2",
                        "14.0",
                        "<b>Other Information</b>",
                        "15.0",
                        "15.1",
                        "15.2",
                        "16.0",
                        "17.0"
                    ],
                    [   # ITEM
                        "",
                        "Structured or Unstructured Abstract",
                        "Study Design",
                        "Sequencing methods",
                        "Specimens",
                        "",
                        "Background and Rationale",
                        "Hypotheses",
                        "",
                        "Study Design",
                        "Participants",
                        "Geographic location",
                        "Relevant Dates",
                        "Eligibility criteria",
                        "Antibiotics Usage",
                        "Analytic sample size",
                        "Longitudinal Studies",
                        "Matching",
                        "Ethics",
                        "Laboratory methods",
                        "Specimen collection",
                        "Shipping",
                        "Storage",
                        "DNA extraction",
                        "Human DNA sequence depletion or microbial DNA enrichment",
                        "Primer selection",
                        "Positive Controls",
                        "Negative Controls",
                        "Contaminant mitigation and identification",
                        "Replication",
                        "Sequencing strategy",
                        "Sequencing methods",
                        "Batch effects",
                        "Metatranscriptomics",
                        "Metaproteomics",
                        "Metabolomics",
                        "Data sources/measurement",
                        "Research design for causal inference",
                        "Selection bias",
                        "Bioinformatic and Statistical Methods",
                        "Quality Control",
                        "Sequence analysis",
                        "Statistical methods",
                        "Longitudinal analysis",
                        "Subgroup analysis",
                        "Missing data",
                        "Sensitivity analyses",
                        "Findings",
                        "Software",
                        "Reproducible research",
                        "Raw data access",
                        "Processed data access",
                        "Participant data access",
                        "Source code access",
                        "Full results",
                        "",
                        "Descriptive data",
                        "Microbiome data",
                        "Taxonomy",
                        "Differential abundance",
                        "Other data types",
                        "Other statistical analysis",
                        "",
                        "Key results",
                        "Interpretation",
                        "Limitations",
                        "Bias",
                        "Generalizability",
                        "Ongoing/future work",
                        "",
                        "Funding",
                        "Acknowledgements",
                        "Conflicts of Interest",
                        "Supplements",
                        "Supplementary data"
                    ],
                    [   # RECOMMENDATION
                        "",
                        "Abstract should include information on background, methods, results, and conclusions in structured or unstructured format.",
                        "State study design in abstract.",
                        "State the strategy used for metagenomic classification.",
                        "Describe body site(s) studied.",
                        "",
                        "Summarize the underlying background, scientific evidence, or theory driving the current hypothesis as well as the study objectives.",
                        "State the pre-specified hypothesis. If the study is exploratory, state any pre-specified study objectives.",
                        "",
                        "Describe the study design.",
                        "State what the population of interest is, and the method by which participants are sampled from that population. Include relevant information on physiological state of the subjects or stage in the life history of disease under study when participants were sampled.",
                        "State the geographic region(s) where participants were sampled from.",
                        "State the start and end dates for recruitment, follow-up, and data collection.",
                        "List any criteria for inclusion and exclusion of recruited participants.",
                        "List what is known about antibiotics usage before or during sample collection.",
                        "Explain how the final analytic sample size was calculated, including the number of cases and controls if relevant, and reasons for dropout at each stage of the study. This should include the number of individuals in whom microbiome sequencing was attempted and the number in whom microbiome sequencing was successful.",
                        "For longitudinal studies, state how many follow-ups were conducted, describe sample size at follow-up by group or condition, and discuss any loss to follow-up.",
                        "For matched studies, give matching criteria.",
                        "State the name of the institutional review board that approved the study and protocols, protocol number and date of approval, and procedures for obtaining informed consent from participants.",
                        "State the laboratory/center where laboratory work was done.",
                        "State the body site(s) sampled from and how specimens were collected.",
                        "Describe how samples were stored and shipped to the laboratory.",
                        "Describe how the laboratory stored samples, including time between collection and storage and any preservation buffers or refrigeration used.",                        
                        "Provide DNA extraction method, including kit and version if relevant.",
                        "Describe whether human DNA sequence depletion or enrichment of microbial or viral DNA was performed.",
                        "Provide primer selection and DNA amplification methods as well as variable region sequenced (if applicable).",
                        "Describe any positive controls (mock communities) if used.",
                        "Describe any negative controls if used.",
                        "Provide any laboratory or computational methods used to control for or identify microbiome contamination from the environment, reagents, or laboratory.",
                        "Describe any biological or technical replicates included in the sequencing, including which steps were replicated between them.",
                        "Major divisions of strategy, such as shotgun or amplicon sequencing.",
                        "State whether experimental quantification was used (QMP/cell count based, spike-in based) or whether relative abundance methods were applied.",
                        "Detail any blocking or randomization used in study design to avoid confounding of batches with exposures or outcomes. Discuss any likely sources of batch effects, if known.",
                        "Detail whether any mRNA enrichment was performed and whether/how retrotranscription was performed prior to sequencing. Provide size range of isolated transcripts. Describe whether the sequencing library was stranded or not. Provide details on sequencing methods and platforms.",
                        "Detail which protease was used for digestion. Provide details on proteomic methods and platforms (e.g. LC-MS/MS, instrument type, column type, mass range, resolution, scan speed, maximum injection time, isolation window, normalised collision energy, and resolution).",
                        "Specify the analytic method used (such as nuclear magnetic resonance spectroscopy or mass spectrometry). For mass spectrometry, detail which fractions were obtained (polar and/or non polar) and how these were analyzed. Provide details on metabolomics methods and platforms (e.g. derivatization, instrument type, injection type, column type and instrument settings).",
                        "For each non-microbiome variable, including the health condition, intervention, or other variable of interest, state how it was defined, how it was measured or collected, and any transformations applied to the variable prior to analysis.",
                        "Discuss any potential for confounding by variables that may influence both the outcome and exposure of interest. State any variables controlled for and the rationale for controlling for them.",
                        "Discuss potential for selection or survival bias.",
                        "Describe any transformations to quantitative variables used in analyses (e.g. use of percentages instead of counts, normalization, rarefaction, categorization).",
                        "Describe any methods to identify or filter low quality reads or samples.",
                        "Describe any taxonomic, functional profiling, or other sequence analysis performed.",
                        "Describe all statistical methods.",
                        "If the study is longitudinal, include a section that explicitly states what analysis methods were used (if any) to account for grouping of measurements by individual or patterns over time.",
                        "Describe any methods used to examine subgroups and interactions.",
                        "Explain how missing data were addressed.",
                        "Describe any sensitivity analyses.",
                        "State criteria used to select findings for reporting.",
                        "Cite all software (including read mapping software) and databases (including any used for taxonomic reference or annotating amplicons, if applicable) used. Include version numbers.",
                        "Make a statement about whether and how others can reproduce the reported analysis.",
                        "State where raw data may be accessed including demultiplexing information.",
                        "State where processed data may be accessed.",
                        "State where individual participant data such as demographics and other covariates may be accessed, and how they can be matched to the microbiome data.",
                        "State where code may be accessed.",
                        "Provide full results of all analyses, in computer-readable format, in supplementary materials.",
                        "",
                        "Give characteristics of study participants (e.g. dietary, demographic, clinical, social) and information on exposures and potential confounders.",
                        "Report descriptive findings for microbiome analyses with all applicable outcomes and covariates.",
                        "Identify taxonomy using standardized taxon classifications that are sufficient to uniquely identify taxa.",
                        "Report results of differential abundance analysis by the variable of interest and (if applicable) by time, clearly indicating the direction of change and total number of taxa tested.",
                        "Report other data analyzed--e.g. metabolic function, functional potential, MAG assembly, and RNAseq.",
                        "Report any statistical data analysis not covered above.",
                        "",
                        "Summarise key results with reference to study objectives.",
                        "Give a cautious overall interpretation of results considering objectives, limitations, multiplicity of analyses, results from similar studies, and other relevant evidence.",
                        "Discuss limitations of the study, taking into account sources of potential bias or imprecision.",
                        "Discuss any potential for bias to influence study findings.",
                        "Discuss the generalisability (external validity) of the study results.",
                        "Describe potential future research or ongoing research based on the study's findings.",
                        "",
                        "Give the source of funding and the role of the funders for the present study and, if applicable, for the original study on which the present article is based.", 
                        "Include acknowledgements of those who contributed to the research but did not meet critera for authorship.",
                        "Include a conflicts of interest statement.",
                        "Indicate where supplements may be accessed and what materials they contain.",
                        "Provide supplementary data files of results with for all taxa and all outcome variables analyzed. Indicate the taxonomic level of all taxa."
                    ],
                    [   # ITEM SOURCE
                        "",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "",
                        "STORMS",
                        "STORMS",
                        "",
                        "STORMS",
                        "STORMS",
                        "MIxS: geographic location (country and/or sea,region)",
                        "STORMS",
                        "Modified STROBE",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "Modified STROBE",
                        "STORMS",
                        "STORMS",
                        "MIxS: sample collection device or method; host body site",
                        "STORMS",
                        "STORMS",
                        "MIxS: nucleic acid extraction",
                        "STORMS",
                        "MIxS: pcr primers",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "MIxS: sequencing method",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "MIxS: host disease status",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "MIxS: sequence quality check",
                        "MIxS: feature prediction; similarity search method",
                        "Modified STROBE",
                        "STORMS",
                        "STROBE",
                        "STROBE",
                        "STROBE",
                        "STORMS",
                        "Modified STREGA",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "",
                        "STROBE",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "",
                        "STROBE",
                        "STROBE",
                        "STROBE",
                        "STORMS",
                        "STROBE",
                        "STORMS",
                        "",
                        "STROBE",
                        "STORMS",
                        "STORMS",
                        "STORMS",
                        "STORMS"
                    ],
                    [   # ADDITIONAL GUIDANCE
                        "",
                        "",
                        "See 3.0 for additional information on study design.",
                        "For example, targeted 16S by qPCR or sequencing, shotgun metagenomics, metatranscriptomics, etc.",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "Observational (Case-Control, Cohort, Cross-sectional survey, etc.) or Experimental (Randomized controlled trial, Non-randomized controlled trial, etc.). For a brief description of common study designs see: DOI: 10.11613/BM.2014.022. If applicable, describe any blinding (e.g. single or double-blinding) used in the course of the study.",
                        "Examples of the population of interest could be: adults with no chronic health conditions, adults with type II diabetes, newborns, etc. This is the total population to whom the study is hoped to be generalizable to. The sampling method describes how potential participants were selected from that population.\n\n If the participants are from a substudy of a larger study, provide a brief description of that study and cite that study.\n\n Clearly state how cases and controls are defined.\n\n An example of relevant physiological state might be pre/post menopausal for a vaginal microbiome study; examples of stage in the life history of disease could be whether specimens were collected",
                        "Geographic coordinates can be reported to prevent potential ambiguities if necessary.",
                        "Recruitment is the period in which participants are recruited for the study. In longitudinal studies, follow-up is the date range in which participants are asked to complete a specific assessment. Finally, data collection is the total period in which data is being collected from participants including during initial recruitment through all follow-ups.",
                        "Among potential recruited participants, how were some chosen and others not? This could include criteria such as sex, diet, age, health status, or BMI.\n\nIf there is a primary and validation sample, describe inclusion/exclusion criteria for each.",
                        "If participants were excluded due to current or recent antibiotics usage, state this here.\n\nOther factors (e.g. proton pump inhibitors, probiotics, etc.) that may influence the microbiome should also be described as well.",
                        "Consider use of a flow diagram (see template at https://stormsmicrobiome.org/figures). Also state sample size in abstract.\n\nIf power analysis was used to calculate sample size, describe those calculations.",
                        "If there is loss to follow-up, discuss the likelihood that drop-out is associated with exposures, treatments, or outcomes of interest.",
                        "\"Matched\" refers to matching between comparable study participants as cases and controls or exposed / unexposed.\n\nIndicate whether participants were individual or frequency matched and in what ratio were they matched (e.g. 1 case to 1 control).",
                        "",
                        "Provide a reference to complete lab protocols if previously published elsewhere such as on protocols.io. Note any modifications of lab protocols and the reason for protocol modifications.",
                        "Use terms from the Uber-anatomy Ontology (https://www.ebi.ac.uk/ols/ontologies/uberon) to describe body sites in a standardized format.",
                        "Include length of time from collection to receipt by the lab and if temperature control was used during shipping.",
                        "State where each procedure or lot of samples was done if not all in the same place.\n\nInclude reagent/lot/catalogue #s for storage buffers.",
                        "If any DNA quantification methods were used prior to DNA amplification or at the pooling step of library preparation, state so here.",
                        "",
                        "",
                        "If used, should be deposited under guidance provided in the 8.X items.",
                        "If used, should be deposited under guidance provided in the 8.X items.",
                        "Includes filtering of reagents and other steps to minimize contamination. It is relevant to state whether the specimens of interest have low microbial load, which makes contamination especially relevant.",
                        "Replication may be biological (redundant biological specimens) or technical (aliquots taken at different stages of analysis) and used in extraction, sequencing, preprocessing, and/or data analysis.",
                        "For amplicon sequencing (for example, 16S variable region), state the region selected. State the model of sequencer used.",
                        "These include read length, sequencing depth per sample (average and minimum), whether reads are paired, and other parameters.",
                        "Sources of batch effects include sample collection, storage, library preparation, and sequencing and are commonly unavoidable in all but the smallest of studies.",
                        "Provide details on any internal standards which may have been used as well as parameters and versions of any software or databases used.",
                        "Provide details on any internal standards which may have been used as well as parameters and versions of any software or databases used.",
                        "Provide details on any internal standards which may have been used as well as parameters and versions of any software or databases used.",
                        "State any sources of potential bias in measurements, for example multiple interviewers or measurement instruments, and whether these potential biases were assessed or accounted for in study design.\n\nUse terms from a standardized ontology such as the Experimental Factor Ontology (https://www.ebi.ac.uk/efo/) to describe variables of interest in a standardized format.",
                        "For causal inference, this item refers to describing the assumptions that would be required to draw causal inferences from observational data. See Vujkovic-Cvijin, I., Sklar, J., Jiang, L. et al. Host variables confound gut microbiota studies of human disease. Nature 587, 448–454 (2020). https://doi.org/10.1038/s41586-020-2881-9 for more details on confounding in observational microbiome studies.\n\n For example, hypothesized confounders may be controlled for by multivariable adjustment. Consider using a directed acyclic graph (DAG) to describe your causal model and justify any variables controlled for. DAGs can be made using www.dagitty.net.",
                        "Selection bias can occur when some members of the target study population are more likely to be included in the study/final analytic sample than others. Some examples include survival bias (where part of the target study population is more likely to die before they can be studied), convenience sampling (where members of the target study population are not selected at random), and loss to follow-up (when probability of dropping out is related to one of the things being studied).",
                        "If a variable is analyzed using different transformations, state rationale for the transformation and for each analyses which version of the variable is used.\n\nIn case of any complex or multistep transformations, give enumerated instructions for reproducing those transformations.",
                        "If samples were excluded based on quality or read depth, list the criteria used, the number of samples excluded, and the final sample size after quality control.",
                        "",
                        "Describe any statistical tests used, exploratory data analysis performed, dimension reduction methods/unsupervised analysis, alpha/beta metrics, and/or methods for adjusting for measurement bias.\n\nIf multiple statistical methods are possible, discuss why the methods used were selected.\n\nIf a multiple hypothesis testing correction method was used, describe the type of correction used.\n\nState which taxonomic levels are analyzed.",
                        "",
                        "",
                        "\"Missing data\" refers to participant measurements such as covariates, exposures, outcomes, or time points that should have been collected but were not, not to zeros in taxonomic abundance tables or data points not applicable to that observation.",
                        "",
                        "For example, false discovery rate with total number of tests, effect size threshold, significance threshold, microbes of interest.",
                        "Installed packages, add-ons or libraries should be stated and cited in addition to the software used.\n\nAll parameters employed that differ from the default of that software/version should be provided.\n\nThis is in addition to, not a replacement for, publishing of code as outlined in the section Reproducible Research.",
                        "Any protected information that has been excluded or provided under controlled access should be listed along with any relevant data access procedures. \"On request from authors\" is not sufficiently detailed; formal data access procedures and conditions should be defined.\n\nIf data are unavailable, state so clearly.\n\nConsider using a specialized rubric for reproducible research (such as: https://mbio.asm.org/content/9/3/e00525-18.short).\n\nConsider preregistering the study protocol (such as on osf.io or https://plos.org/open-science/preregistration/).",
                        "Robust, long-term databases such as those hosted by NCBI and EBI are preferred. If using a private repository, provide rationale.",
                        "Unfiltered data should be provided.\n\nRobust, long-term databases such as those hosted by NCBI and EBI-EMBL are preferred. Repositories like zenodo (https://zenodo.org/) or publisso (https://www.publisso.de/en/working-for-you/doi-service/)\n\ncan be used to provide a DOI and long-term storage for processed datasets, even those which cannot be published openly.",
                        "If re-categorized, transformed, or otherwise derived variables were used in the analysis, these variables or code for deriving them should be provided.\n\nExamples of how participant data can be matched to microbiome data are: using the same set of anonymized identifiers, or using different anonymized identifiers but providing a map.\n\nProvided data should be sufficient to independently replicate the current analysis.",
                        "If a standard or formalized workflow was employed, reference it here.",
                        "For example, any fold-changes, p-values, or FDR values calculated, provided as a spreadsheet.\n\nUse a machine-readable, plain-text format such as csv or tsv.",
                        "",
                        "Typically reported in a table included in the paper or as a supplementary table. Indicate number of participants with missing data for each variable of interest.\n\nThis includes environmental and lifestyle factors that may affect the relationship between the microbiome and the condition of interest. Participant diet and medication use should be summarized, if known.\n\nAt minimum, age and sex of all participants should be summarized.",
                        "This includes measures of diversity as well as relative abundances. These descriptive findings should be reported both for the sample overall and for individual groups.",
                        "If not using full taxonomic hierarchy, make sure it is clear whether names stated are species, genera, family, etc.\n\nItalicize genus/species pairs. Consult journal guidelines or standardized references on taxonomic nomenclature. For instance, https://wwwnc.cdc.gov/eid/page/scientific-nomenclature",
                        "If there are more than two groups, include omnibus (multigroup) test results if applicable to the research question.\n\nIf applicable, reported effect sizes should include a measure of uncertainty such as the confidence interval.",
                        "",
                        "This could include subgroup analysis, sensitivity analyses, and cluster analysis.\n\nVisualizations should be easily interpretable and colorblind-friendly. The caption and/or main text should provide a detailed description of visualizations for visually-impaired readers.",
                        "",
                        "",
                        "Define or clarify any subjective terms such as \"dominant,\" \"dysbiosis,\" and similar words used in interpretation of results.\n\nWhen interpreting the findings, consider how the interpretation of the findings may be summarized or quoted for the general public such as in press releases or news articles.\n\nIf causal language is used in the interpretation (such as \"alters,\" \"affects,\" \"results in,\" \"causes,\" or \"impacts\"), assumptions made for causal inference should be explicitly stated as part of 6.0 and 13.0.\n\nDistinguish between function potential (ie inferred from metagenomics) and observed activity (ie metatranscriptomic, metabolomic, proteomic) if discussing microbial function.",
                        "Also consider limitations resulting from the methods (especially novel methods), the study design, and the sample size. ",
                        "May include sampling method, representativeness of study participants, or potential confounding.",
                        "To what populations or other settings do you expect the conclusions to generalize?",
                        "",
                        "",
                        "",
                        "For general guidelines on authorship, see http://www.icmje.org and https://www.elsevier.com/authors/journal-authors/policies-and-ethics/credit-author-statement",
                        "",
                        "",
                        "Depending on the analysis performed, examples of the supplemental results included could be mean relative abundance, differential abundance, raw p-value, multiple hypothesis testing-adjusted p-values, and standard error.\n\nAll discussed taxa should include the taxonomic level (e.g. class, order, genus)."
                    ],
                    [   # YES/NO/NA
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
                    ],
                    [   # COMMENTS OR LOCATION IN MANUSCRIPT
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
                    ]
                ]
            )
        )
    )
end

checklist()