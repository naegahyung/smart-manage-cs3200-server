SHOW_ALL_PROPERTIES = 'SELECT * FROM `smart_manage`.`managed_property`'

SHOW_ALL_TASKS = 'SELECT * FROM `smart_manage`.`task` as `task` ORDER BY `task`.`updated`'

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

def show_tasks_under_property(id):
    return 'SELECT * FROM `smart_manage`.`task` WHERE `property_id` = "%s"' % (id)

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