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
    description: "Tiers of profit broken out in high, medium and low. High being greater than $75, Medium greater than $30 and less than $75 and Low is less than $30"
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

  measure: average_purchase_by_user{
    label: "Average purchase total by user"
    description: "Total sale price divided by the count of users"
    type: number
    sql: ${Total_Sale_Price}/NULLIF(${users.count}, 0) ;;
    drill_fields: [details*]
  }

measure: percent_of_total_profit {
  description: "Item profit as a percentage of total profit"
  type: number
  sql: ${Profit}/NULLIF(${Total_Profit},0) ;;
  drill_fields: [details*]
  value_format_name: percent_1
}


  measure: average_sale_price {
    label: "Average item sale price"
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
    label: "Highest Profit Item"
    description: "Item with the highest profit margin"
    type: max
    sql: ${Profit} ;;
    value_format_name: usd
    drill_fields: [details*]
  }
  measure: lowest_item_profit {
    label: "Lowest Profit Item"
    description: "Item with the lowest profit margin"
    type: min
    sql: ${Profit} ;;
    value_format_name: usd
    drill_fields: [details*]
  }
  set: details {
    fields: [id, sale_price, Profit]
  }

}
