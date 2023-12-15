using DataFrames

box_num_observational = [1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10]
box_lab_observational = [
    "Observational",
    "Expression of interest",
    "Assessment for eligibility:",
    "Screened",
    "Excluded:",
    "Recruited",
    "Drop out:",
    "Data available for analysis",
    "Excluded:",
    "Excluded",
    "Total samples included in the analysis"]
box_var_observational = [nothing,nothing,"xxxx",nothing,"xxxx",nothing,"xxxx",nothing,"Lack of sequencing","Low number of reads",nothing]
n_observational = [nothing,"xx","xx","xx","xx","xx","xx","xx","xx","xx","xx"]
obeservational_data = DataFrame(
    box_num=box_num_observational,
    box_lab=box_lab_observational,
    box_var=box_var_observational,
    n=n_observational
)

box_num_experimental = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11, 12]
box_lab_experimental = [
    "Experimental",
    "Expression of interest",
    "Assessment for eligibility:",
    "Screened",
    "Excluded:",
    "Recruited and randomized",
    "Group 1","Group 2",
    "Drop out:",
    "Completed trial",
    "Excluded:",
    "Excluded:",
    "Total samples included in the analysis"]
box_var_experimental = [nothing,nothing,"xxxx",nothing,"xxxx",nothing,nothing,nothing,"xxxx",nothing,"Lack of sequencing","Low number of reads",nothing]
n_experimental = [nothing,"xx","xx","xx","xx","xx","xx","xx","xx","xx","xx","xx","xx"]
experimental_data = DataFrame(
    box_num=box_num_experimental,
    box_lab=box_lab_experimental,
    box_var=box_var_experimental,
    n=n_experimental
)