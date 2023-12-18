using Dash

not_found_404 = html_div([
    dcc_link(href="/404"),
    html_h1("404: Not found"),
    html_p("The requested URL was not found on this server.")
])