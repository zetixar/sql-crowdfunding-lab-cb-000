# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts
"SELECT Projects.title, SUM(Pledges.amount)
 FROM projects
 JOIN pledges
 ON Projects.id = Pledges.project_id
 GROUP BY project_id
 ORDER BY Projects.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
"SELECT users.name, users.age, SUM(pledges.amount)
   FROM Pledges
   JOIN users
   ON pledges.user_id = users.id
   GROUP BY pledges.user_id
   ORDER BY users.name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT projects.title, SUM(pledges.amount) - projects.funding_goal AS difference
 FROM Pledges
 JOIN projects
 ON pledges.project_id = projects.id
 GROUP BY pledges.project_id
 HAVING SUM(pledges.amount) >= projects.funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
"SELECT users.name, SUM(pledges.amount)
 FROM users
 JOIN pledges
 ON users.id = pledges.user_id
 GROUP BY pledges.user_id
 ORDER BY SUM(pledges.amount), Users.name;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT projects.category, pledges.amount
 FROM pledges
 JOIN projects
 ON pledges.project_id = projects.id
 WHERE projects.category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
  "SELECT projects.category, SUM(pledges.amount)
   FROM pledges
   JOIN projects
   ON pledges.project_id = projects.id
   GROUP BY projects.category
   HAVING projects.category = 'books';"
end
