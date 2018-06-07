- dashboard: dashboard_1
  title: dashboard_1
  layout: newspaper
  elements:
  - title: Profit by State
    name: Profit by State
    model: alex_burch_project
    explore: users
    type: looker_map
    fields:
    - order_items.Total_Profit
    - users.zip
    filters: {}
    sorts:
    - order_items.Total_Profit desc
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    map: auto
    map_projection: ''
    quantize_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    map_latitude: 42.75564674264636
    map_longitude: -75.01722335815431
    map_zoom: 6
    listen:
      State: users.state
      Sold Date: inventory_items.sold_date
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Orders by Gender
    name: Orders by Gender
    model: alex_burch_project
    explore: order_items
    type: looker_pie
    fields:
    - users.gender
    - orders.count
    sorts:
    - orders.count desc
    limit: 500
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
    series_labels:
      f: Female
      m: Male
    listen:
      State: users.state
      Sold Date: inventory_items.sold_date
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Average Profit by Age Group
    name: Average Profit by Age Group
    model: alex_burch_project
    explore: users
    type: table
    fields:
    - users.age_groups
    - order_items.Average_Profit
    fill_fields:
    - users.age_groups
    sorts:
    - users.age_groups
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: linear
    series_types: {}
    listen:
      State: users.state
      Sold Date: inventory_items.sold_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Highest Profit Item
    name: Highest Profit Item
    model: alex_burch_project
    explore: order_items
    type: single_value
    fields:
    - order_items.highest_item_profit
    - order_items.lowest_item_profit
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Highest Profit Item
    comparison_label: Lowest Profit Item
    listen:
      State: users.state
      Sold Date: inventory_items.sold_date
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Total Profit by Profit Margin and Age
    name: Total Profit by Profit Margin and Age
    model: alex_burch_project
    explore: order_items
    type: looker_line
    fields:
    - order_items.Profit_Tiers
    - users.age_groups
    - order_items.Total_Profit
    pivots:
    - order_items.Profit_Tiers
    fill_fields:
    - order_items.Profit_Tiers
    filters:
      users.age_groups: "-Below 0,-0 to 9"
    sorts:
    - order_items.Profit_Tiers
    - users.age_groups
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 15
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      State: users.state
      Sold Date: inventory_items.sold_date
    row: 6
    col: 8
    width: 8
    height: 6
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: California
    allow_multiple_values: true
    required: true
    model: alex_burch_project
    explore: order_items
    listens_to_filters: []
    field: users.state
  - name: Sold Date
    title: Sold Date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: alex_burch_project
    explore: order_items
    listens_to_filters: []
    field: inventory_items.sold_date
