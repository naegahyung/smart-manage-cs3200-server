SHOW_ALL_PROPERTIES = '''
SELECT `p`.`id`, street1, `street 2`, city, state, zip, `status`, rooms, bathrooms, rent_amount, rent_due, property_type
FROM smart_manage.Managed_property p
LEFT JOIN address a on p.location = a.geo_location
'''

SHOW_ALL_TASKS = '''
SELECT t.id, t.body, t.created, t.updated, CONCAT(street1, ' ', `street 2`, ' ', city, ', ', state, ' ', zip) as full_address
FROM `smart_manage`.`task` t
left join managed_property p on t.property_id = p.id 
left join address a on p.location = a.geo_location
WHERE t.`done` = 0 
ORDER BY t.`updated` DESC
'''

SHOW_ALL_NEWS = '''
SELECT * 
FROM (	
    SELECT "property" as `label`, "rent_due" as `field`, `street1`, `street 2`, `city`, `state`, `zip`, `rent_due` as `due`
	FROM `smart_manage`.`managed_property` `p`
	LEFT JOIN `smart_manage`.`address` `a` ON `p`.`location` = `a`.`geo_location`
	WHERE `rent_due` is NOT NULL
	UNION ALL
	SELECT "property" as `label`, "last_visited" as `field`, `street1`, `street 2`, `city`, `state`, `zip`, `last_visited` as `due`
	FROM `smart_manage`.`managed_property` `p`
	LEFT JOIN `smart_manage`.`address` `a` ON `p`.`location` = `a`.`geo_location`
	WHERE `last_visited` is NOT NULL
	UNION ALL
	SELECT "property" as `label`, "last_maintenance" as `field`, `street1`, `street 2`, `city`, `state`, `zip`, `last_maintenance` as `due`
	FROM `smart_manage`.`managed_property` `p`
	LEFT JOIN `smart_manage`.`address` `a` ON `p`.`location` = `a`.`geo_location`
	WHERE `last_maintenance` is NOT NULL
) as all_updates
WHERE `all_updates`.`due` > DATE_SUB(NOW(), INTERVAL 1 MONTH)
ORDER BY `all_updates`.`due`
'''

def show_news_with_limit(limit):
    return SHOW_ALL_NEWS + " LIMIT %s" % (limit)

def show_property_info(id):
    return """
    SELECT `p`.`property_type`, `p`.`last_maintenance`, `p`.`last_visited`, `p`.`value`, 
	`p`.`tax_amount`, `p`.`rent_due`, `p`.`total_spending`, `p`.`rent_amount`, `p`.`status`, 
    `p`.`rooms`, `p`.`bathrooms`, `o`.`name` "owner_name", `o`.`phone_num` "owner_phone", `o`.`email` "owner_email",
    `a`.`street1`, `a`.`street 2`, `a`.`city`, `a`.`state`, `a`.`zip`,
    `t`.`name` "tenant_name", `t`.`credit_score`, `t`.`contract_expiration` "tenant_contract_due", `t`.`last_paid` "last_rent_payment_date" 
    FROM `smart_manage`.`Managed_property` `p`, `smart_manage`.`property_owner` `o`, `smart_manage`.`address` `a`, `smart_manage`.`tenant` `t`
    WHERE `p`.`id` = "%s"
	AND `p`.`owned_by` = `o`.`id`
    AND `p`.`location` = `a`.`geo_location`
    AND `t`.`living_location` = "%s"
    """ % (id, id)

def get_property_address(id):
    return '''
    SELECT CONCAT(street1, " ", `street 2`, " ", city, " ", state, " ", zip) full_address
	FROM address a, managed_property p
    WHERE p.id = "%s"
		AND p.location = a.geo_location
    LIMIT 1
    ''' % (id)

def show_tasks_under_property(id):
    return '''
    SELECT t.id, t.body, t.created, t.updated, CONCAT(street1, ' ', `street 2`, ' ', city, ', ', state, ' ', zip) as full_address
    FROM `smart_manage`.`task` t
    left join managed_property p on t.property_id = p.id 
    left join address a on p.location = a.geo_location
    WHERE t.`done` = 0 AND p.id = "%s" 
    ORDER BY t.`updated` DESC
    ''' % (id)

def add_task(body):
    return '''
    INSERT INTO `smart_manage`.`task` (id, body, created, created_by, updated, done)
    VALUES ("%s", "%s", "%s", "%s", "%s", "%s")
    ''' % (body['id'], body['body'], body['created'], body['created_by'], body['updated'], body['done'])

def add_task_with_property(body):
    return '''
    INSERT INTO `smart_manage`.`task` (id, body, created, created_by, updated, done, property_id)
    VALUES ("%s", "%s", "%s", "%s", "%s", "%s", "%s")
    ''' % (body['id'], body['body'], body['created'], body['created_by'], body['updated'], body['done'], body['property_id'])

def delete_task(body):
    return 'DELETE FROM `smart_manage`.`task` WHERE `id` = "%s"' % (body['data']['id'])

def search_address_query(body):
    return '''
    SELECT *
    FROM (
        SELECT CONCAT(street1, " ", `street 2`, " ", city, " ", state, " ", zip) full_address, p.id
        FROM address a
        RIGHT JOIN managed_property p on a.geo_location =  p.location
    ) full_addresses
    WHERE `full_address` LIKE "%s"
    LIMIT 5
    ''' % ("%" + body['query'] + "%")

def update_task_body(body):
    return '''
    UPDATE `smart_manage`.`task`
    SET body = "%s", updated = "%s"
    WHERE id = "%s"
    ''' % (body['body'], body['updated'], body['id'])