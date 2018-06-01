connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: alex_burch_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alex_burch_project_default_datagroup

explore: order_items {
   join: inventory_items {
     type:left_outer
     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
     relationship: one_to_one
   }

   join: returned_products {
     from: products
     sql_on: ${inventory_items.product_id} = ${returned_products.id} AND ${order_items.returned_date} IS NOT NULL;;
     relationship: many_to_one
   }

   join: non_returned_products {
     from: products
     sql_on: ${inventory_items.product_id} = ${non_returned_products.id} AND ${order_items.returned_date} IS NULL;;
     relationship: many_to_one
   }
 }

 explore: users {
   join: orders {
     type: left_outer
     sql_on: ${orders.user_id}=${users.id};;
   relationship: one_to_many}
     join: order_items {
       type: left_outer
       sql_on: ${orders.id}= ${order_items.order_id} ;;
       relationship: one_to_many
     }
       join: inventory_items {
         type: left_outer
         sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
         relationship: one_to_one
         fields: [inventory_items.cost, inventory_items.sold_date, inventory_items.id, inventory_items.Pricing_Tiers, inventory_items.count]
       }
 }

#  explore: inventory_items {
#    always_filter: {
#      filters: {
#        field: cost
#        value: "<50"
#      }
#    }
# }

 explore: products {}

 explore: orders {}

explore: inventory_items {
#   fields: [ALL_FIELDS*, -returned_items.Profit, -non_returned_items.Profit]
#   from: inventory_items
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
    join: returned_items {
    from: order_items
      type: left_outer
      sql_on: ${returned_items.inventory_item_id} = ${inventory_items.id} where ${returned_items.returned_date} is not null;;
      relationship: one_to_one
    }
      join: non_returned_items {
        from:  order_items
        type: left_outer
        sql_on: ${non_returned_items.inventory_item_id} = ${inventory_items.id} where ${non_returned_items.returned_date} is null ;;
        relationship: one_to_one
      }
}
#
# explore: order_items {
#   join: inventory_items {
#     type:left_outer
#     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
#     relationship: one_to_one
#   }
#
#   join: returned_products {
#     from: products
#     sql_on: ${inventory_items.product_id} = ${returned_products.id} AND ${order_items.returned_date} IS NOT NULL;;
#     relationship: many_to_one
#   }
#
#   join: non_returned_products {
#     from: products
#     sql_on: ${inventory_items.product_id} = ${non_returned_products.id} AND ${order_items.returned_date} IS NULL;;
#     relationship: many_to_one



explore: return_analysis {
  from: order_items
  sql_always_where: ${returned_date} is not null  ;;
  join:  orders{
    type: left_outer
    sql_on: ${return_analysis.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
    join: users {
      type: left_outer
      sql_on: ${orders.user_id} = ${users.id} ;;
      relationship: many_to_one
    }
      join: inventory_items {
        type: left_outer
        sql_on: ${return_analysis.inventory_item_id} = ${inventory_items.id} ;;
        relationship: one_to_one
    }
        join: products {
          type: left_outer
          sql_on: ${inventory_items.product_id} = ${products.id} ;;
          relationship: many_to_one
        }
}

#   joins:
#     - join: inventory_items
#       type: left_outer
#       sql_on: ${order_items.inventory_item_id} = ${inventory_items.id}
#       relationship: many_to_one

#     - join: orders
#       type: left_outer
#       sql_on: ${order_items.order_id} = ${orders.id}
#       relationship: many_to_one

#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one

#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: events
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${events.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: inventory_items
#   joins:
#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one


# - explore: orders
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${orders.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: products

# - explore: schema_migrations

# - explore: user_data
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${user_data.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: users

# - explore: users_nn
