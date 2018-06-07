view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count_pending_orders  {
    label: "Pending Orders"
    type: count
    filters: {
      field: status
      value: "pending"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name]
  }
}
