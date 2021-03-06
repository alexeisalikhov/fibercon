DECLARE @adyenDefinitionId AS int
SET @adyenDefinitionId = (SELECT DefinitionId FROM uCommerce_Definition WHERE Name = 'Adyen')

IF NOT EXISTS(SELECT * FROM uCommerce_DefinitionField WHERE Name = 'NotificationUsername' AND DefinitionId = @adyenDefinitionId)
BEGIN
	INSERT INTO uCommerce_DefinitionField VALUES
	(
		1, @adyenDefinitionId, 'NotificationUsername', 1, 0, 1, 0, 0, 0, 1, 'Notification user name for notification messages', NEWID()
	)
	INSERT INTO uCommerce_DefinitionField VALUES
	(
		1, @adyenDefinitionId, 'NotificationPassword', 1, 0, 1, 0, 0, 0, 1, 'Notification password for notification messages', NEWID()
	)
END




