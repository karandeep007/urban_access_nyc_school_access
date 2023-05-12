from bokeh.io import show
from bokeh.plotting import figure
from bokeh.models import (
    ColumnDataSource,
    HoverTool,
    LogColorMapper
)
from bokeh.sampledata.us_counties import data as counties

counties = {
    code: county for code, county in counties.items() if county["state"] == "ny"

}
county_names = ['Bronx', 'Kings','New York','Queens', 'Richmond']

county_xs = [county["lons"] for county in counties.values() if county['name'] in county_names ]
county_ys = [county["lats"] for county in counties.values() if county['name'] in county_names]



source = ColumnDataSource(data=dict(
    x=county_xs,
    y=county_ys,
    name=county_names
))

TOOLS = "pan,wheel_zoom,reset,hover,save"

p = figure(
    title="New york", tools=TOOLS,
    x_axis_location=None, y_axis_location=None
)
p.grid.grid_line_color = None

p.patches('x', 'y',fill_color="blue",source=source,fill_alpha=0.7, line_color="white", line_width=0.5)

hover = p.select_one(HoverTool)
hover.point_policy = "follow_mouse"
hover.tooltips = [
    ("Name", "@name"),
    ("(Long, Lat)", "($x, $y)"),
]



show(p)
