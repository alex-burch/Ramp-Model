view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: Profit {
    type: number
    sql: ${sale_price} - ${inventory_items.cost} ;;
    value_format_name: usd
  }
  dimension: Profit_Tiers  {
    case: {
      when: {
        sql: ${Profit} > 75 ;;
        label: "High Margin"}
      when: {
        sql: ${Profit} > 30 and ${Profit} < 75  ;;
        label: "Medium Margin"}
      else: "Low Margin"
      }
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
    drill_fields: [details*]
  }

  measure: count {
    type: count
    drill_fields: [details*]
  }
  measure: Total_Sale_Price {
    type:  sum
    sql: ${sale_price};;
    value_format_name: usd
    drill_fields: [details*]
  }

  measure: Total_Profit {
    type: sum
    sql: ${Profit} ;;
    value_format_name: usd
    drill_fields: [details*]
  }
  measure: Average_Profit {
    type: average
    sql: ${Profit} ;;
    value_format_name: usd
    drill_fields: [details*]
  }
#   measure: total_returns {
#     type: count_distinct
#     sql: ${returned_date} ;;
#   }
  measure: highest_item_profit {
    type: max
    sql: ${Profit} ;;
    value_format_name: usd
    drill_fields: [details*]
  }
  measure: lowest_item_profit {
    type: min
    sql: ${Profit} ;;
    value_format_name: usd
    drill_fields: [details*]
  }
  set: details {
    fields: [id, sale_price, Profit]
  }

}
