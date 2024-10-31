nsduh_table_format = function(html, table_num, drug_name) {
  drug_table = 
    html |>
    html_table() |>
    nth(table_num) |>
    slice(-1) |>
    mutate(drug = drug_name)
  
  return(drug_table)
}
