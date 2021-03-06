/*

	Marketing Foundation 1.0

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'tmpErrors')) DROP TABLE tmpErrors
GO
CREATE TABLE tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Creating [dbo].[uCommerce_VoucherCode]'
GO
CREATE TABLE [dbo].[uCommerce_VoucherCode]
(
[VoucherCodeId] [int] NOT NULL IDENTITY(1, 1),
[TargetId] [int] NOT NULL,
[NumberUsed] [int] NOT NULL CONSTRAINT [DF_uCommerce_VoucherCode_NumberUsed] DEFAULT ((0)),
[MaxUses] [int] NOT NULL,
[Code] [nvarchar] (512) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_VoucherCode_1] on [dbo].[uCommerce_VoucherCode]'
GO
ALTER TABLE [dbo].[uCommerce_VoucherCode] ADD CONSTRAINT [PK_uCommerce_VoucherCode_1] PRIMARY KEY CLUSTERED  ([VoucherCodeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[uCommerce_DefinitionType]'
GO
ALTER TABLE [dbo].[uCommerce_DefinitionType] ADD
[SortOrder] [int] NOT NULL CONSTRAINT [DF_uCommerce_DefinitionType_SortOrder] DEFAULT ((0))
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_DefinitionTypeDescription]'
GO
CREATE TABLE [dbo].[uCommerce_DefinitionTypeDescription]
(
[DefinitionTypeDescriptionId] [int] NOT NULL IDENTITY(1, 1),
[DefinitionTypeId] [int] NOT NULL,
[DisplayName] [nvarchar] (512) NOT NULL,
[Description] [nvarchar] (max) NULL,
[CultureCode] [nvarchar] (60) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_DefinitionTypeDescription] on [dbo].[uCommerce_DefinitionTypeDescription]'
GO
ALTER TABLE [dbo].[uCommerce_DefinitionTypeDescription] ADD CONSTRAINT [PK_DefinitionTypeDescription] PRIMARY KEY CLUSTERED  ([DefinitionTypeDescriptionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_Award]'
GO
CREATE TABLE [dbo].[uCommerce_Award]
(
[AwardId] [int] NOT NULL IDENTITY(1, 1),
[CampaignItemId] [int] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_Award] on [dbo].[uCommerce_Award]'
GO
ALTER TABLE [dbo].[uCommerce_Award] ADD CONSTRAINT [PK_uCommerce_Award] PRIMARY KEY CLUSTERED  ([AwardId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_AmountOffOrderLinesAward]'
GO
CREATE TABLE [dbo].[uCommerce_AmountOffOrderLinesAward]
(
[AmountOffOrderLinesAwardId] [int] NOT NULL,
[AmountOff] [decimal] (18, 2) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_AmountOffOrderLinesAward] on [dbo].[uCommerce_AmountOffOrderLinesAward]'
GO
ALTER TABLE [dbo].[uCommerce_AmountOffOrderLinesAward] ADD CONSTRAINT [PK_uCommerce_AmountOffOrderLinesAward] PRIMARY KEY CLUSTERED  ([AmountOffOrderLinesAwardId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_AmountOffOrderTotalAward]'
GO
CREATE TABLE [dbo].[uCommerce_AmountOffOrderTotalAward]
(
[AmountOffOrderTotalAwardId] [int] NOT NULL,
[AmountOff] [decimal] (18, 2) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_AmountOffOrderTotalAward_1] on [dbo].[uCommerce_AmountOffOrderTotalAward]'
GO
ALTER TABLE [dbo].[uCommerce_AmountOffOrderTotalAward] ADD CONSTRAINT [PK_uCommerce_AmountOffOrderTotalAward_1] PRIMARY KEY CLUSTERED  ([AmountOffOrderTotalAwardId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_AmountOffUnitAward]'
GO
CREATE TABLE [dbo].[uCommerce_AmountOffUnitAward]
(
[AmountOffUnitAwardId] [int] NOT NULL,
[AmountOff] [decimal] (18, 2) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_AmountOffUnitAward] on [dbo].[uCommerce_AmountOffUnitAward]'
GO
ALTER TABLE [dbo].[uCommerce_AmountOffUnitAward] ADD CONSTRAINT [PK_uCommerce_AmountOffUnitAward] PRIMARY KEY CLUSTERED  ([AmountOffUnitAwardId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_CampaignItem]'
GO
CREATE TABLE [dbo].[uCommerce_CampaignItem]
(
[CampaignItemId] [int] NOT NULL IDENTITY(1, 1),
[CampaignId] [int] NOT NULL,
[DefinitionId] [int] NOT NULL,
[Name] [nvarchar] (512) NULL,
[Enabled] [bit] NOT NULL,
[Priority] [int] NULL,
[AllowNextCampaignItems] [bit] NOT NULL,
[CreatedBy] [nvarchar] (50) NULL,
[ModifiedBy] [nvarchar] (50) NULL,
[CreatedOn] [datetime] NOT NULL,
[ModifiedOn] [datetime] NOT NULL,
[Deleted] [bit] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_CampaignItem] on [dbo].[uCommerce_CampaignItem]'
GO
ALTER TABLE [dbo].[uCommerce_CampaignItem] ADD CONSTRAINT [PK_uCommerce_CampaignItem] PRIMARY KEY CLUSTERED  ([CampaignItemId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_Campaign]'
GO
CREATE TABLE [dbo].[uCommerce_Campaign]
(
[CampaignId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (512) NULL,
[StartsOn] [datetime] NOT NULL,
[EndsOn] [datetime] NOT NULL,
[Enabled] [bit] NOT NULL,
[Priority] [int] NULL,
[Deleted] [bit] NOT NULL,
[CreatedBy] [nvarchar] (50) NULL,
[ModifiedBy] [nvarchar] (50) NULL,
[CreatedOn] [datetime] NOT NULL,
[ModifiedOn] [datetime] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_Campaign] on [dbo].[uCommerce_Campaign]'
GO
ALTER TABLE [dbo].[uCommerce_Campaign] ADD CONSTRAINT [PK_uCommerce_Campaign] PRIMARY KEY CLUSTERED  ([CampaignId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_uCommerce_Campaign] on [dbo].[uCommerce_Campaign]'
GO
CREATE NONCLUSTERED INDEX [IX_uCommerce_Campaign] ON [dbo].[uCommerce_Campaign] ([CampaignId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_Target]'
GO
CREATE TABLE [dbo].[uCommerce_Target]
(
[TargetId] [int] NOT NULL IDENTITY(1, 1),
[CampaignItemId] [int] NOT NULL,
[EnabledForDisplay] [bit] NOT NULL,
[EnabledForApply] [bit] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_Target] on [dbo].[uCommerce_Target]'
GO
ALTER TABLE [dbo].[uCommerce_Target] ADD CONSTRAINT [PK_uCommerce_Target] PRIMARY KEY CLUSTERED  ([TargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_CategoryTarget]'
GO
CREATE TABLE [dbo].[uCommerce_CategoryTarget]
(
[CategoryTargetId] [int] NOT NULL,
[Name] [nvarchar] (60) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_CategoryTarget] on [dbo].[uCommerce_CategoryTarget]'
GO
ALTER TABLE [dbo].[uCommerce_CategoryTarget] ADD CONSTRAINT [PK_uCommerce_CategoryTarget] PRIMARY KEY CLUSTERED  ([CategoryTargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_Discount]'
GO
CREATE TABLE [dbo].[uCommerce_Discount]
(
[DiscountId] [int] NOT NULL IDENTITY(1, 1),
[OrderId] [int] NOT NULL,
[CampaignName] [nvarchar] (512) NULL,
[CampaignItemName] [nvarchar] (512) NULL,
[Description] [nvarchar] (512) NULL,
[AmountOffTotal] [decimal] (18, 2) NOT NULL,
[CreatedOn] [datetime] NOT NULL,
[ModifiedOn] [datetime] NOT NULL,
[CreatedBy] [nvarchar] (50) NOT NULL,
[ModifiedBy] [nvarchar] (50) NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_Discount] on [dbo].[uCommerce_Discount]'
GO
ALTER TABLE [dbo].[uCommerce_Discount] ADD CONSTRAINT [PK_uCommerce_Discount] PRIMARY KEY CLUSTERED  ([DiscountId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_EntityUi]'
GO
CREATE TABLE [dbo].[uCommerce_EntityUi]
(
[EntityUiId] [int] NOT NULL IDENTITY(1, 1),
[Type] [nvarchar] (512) NOT NULL,
[VirtualPathUi] [nvarchar] (512) NULL,
[SortOrder] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_EntityUi] on [dbo].[uCommerce_EntityUi]'
GO
ALTER TABLE [dbo].[uCommerce_EntityUi] ADD CONSTRAINT [PK_EntityUi] PRIMARY KEY CLUSTERED  ([EntityUiId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [IX_uCommerce_EntityUi_Type] on [dbo].[uCommerce_EntityUi]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_uCommerce_EntityUi_Type] ON [dbo].[uCommerce_EntityUi] ([EntityUiId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_EntityUiDescription]'
GO
CREATE TABLE [dbo].[uCommerce_EntityUiDescription]
(
[EntityUiDescriptionId] [int] NOT NULL IDENTITY(1, 1),
[EntityUiId] [int] NOT NULL,
[DisplayName] [nvarchar] (512) NOT NULL,
[Description] [nvarchar] (max) NULL,
[CultureCode] [nvarchar] (60) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_EntityUiDescription] on [dbo].[uCommerce_EntityUiDescription]'
GO
ALTER TABLE [dbo].[uCommerce_EntityUiDescription] ADD CONSTRAINT [PK_uCommerce_EntityUiDescription] PRIMARY KEY CLUSTERED  ([EntityUiDescriptionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_OrderLineDiscountRelation]'
GO
CREATE TABLE [dbo].[uCommerce_OrderLineDiscountRelation]
(
[OrderLineDiscountRelationId] [int] NOT NULL IDENTITY(1, 1),
[DiscountId] [int] NOT NULL,
[OrderLineId] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_OrderLineDiscountRelation] on [dbo].[uCommerce_OrderLineDiscountRelation]'
GO
ALTER TABLE [dbo].[uCommerce_OrderLineDiscountRelation] ADD CONSTRAINT [PK_uCommerce_OrderLineDiscountRelation] PRIMARY KEY CLUSTERED  ([OrderLineDiscountRelationId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_ProductCatalogTarget]'
GO
CREATE TABLE [dbo].[uCommerce_ProductCatalogTarget]
(
[ProductCatalogTargetId] [int] NOT NULL,
[Name] [nvarchar] (60) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_ProductCatalogTarget] on [dbo].[uCommerce_ProductCatalogTarget]'
GO
ALTER TABLE [dbo].[uCommerce_ProductCatalogTarget] ADD CONSTRAINT [PK_ProductCatalogTarget] PRIMARY KEY CLUSTERED  ([ProductCatalogTargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_ProductTarget]'
GO
CREATE TABLE [dbo].[uCommerce_ProductTarget]
(
[ProductTargetId] [int] NOT NULL,
[Sku] [nvarchar] (30) NOT NULL,
[VariantSku] [nvarchar] (30) NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_ProductTarget] on [dbo].[uCommerce_ProductTarget]'
GO
ALTER TABLE [dbo].[uCommerce_ProductTarget] ADD CONSTRAINT [PK_uCommerce_ProductTarget] PRIMARY KEY CLUSTERED  ([ProductTargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_VoucherTarget]'
GO
CREATE TABLE [dbo].[uCommerce_VoucherTarget]
(
[VoucherTargetId] [int] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_SingleUseVoucher_1] on [dbo].[uCommerce_VoucherTarget]'
GO
ALTER TABLE [dbo].[uCommerce_VoucherTarget] ADD CONSTRAINT [PK_uCommerce_SingleUseVoucher_1] PRIMARY KEY CLUSTERED  ([VoucherTargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[uCommerce_PurchaseOrder]'
GO
ALTER TABLE [dbo].[uCommerce_PurchaseOrder] ADD
[Discount] [money] NULL,
[DiscountTotal] [money] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[uCommerce_OrderLine]'
GO
ALTER TABLE [dbo].[uCommerce_OrderLine] ADD
[UnitDiscount] [money] NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_OrderAmountTarget]'
GO
CREATE TABLE [dbo].[uCommerce_OrderAmountTarget]
(
[OrderAmountTargetId] [int] NOT NULL,
[MinAmount] [decimal] (18, 2) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_OrderAmountTarget] on [dbo].[uCommerce_OrderAmountTarget]'
GO
ALTER TABLE [dbo].[uCommerce_OrderAmountTarget] ADD CONSTRAINT [PK_OrderAmountTarget] PRIMARY KEY CLUSTERED  ([OrderAmountTargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[uCommerce_ProductCatalogGroupTarget]'
GO
CREATE TABLE [dbo].[uCommerce_ProductCatalogGroupTarget]
(
[ProductCatalogGroupTargetId] [int] NOT NULL,
[Name] [nvarchar] (60) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_uCommerce_ProductCatalogGroupTarget] on [dbo].[uCommerce_ProductCatalogGroupTarget]'
GO
ALTER TABLE [dbo].[uCommerce_ProductCatalogGroupTarget] ADD CONSTRAINT [PK_uCommerce_ProductCatalogGroupTarget] PRIMARY KEY CLUSTERED  ([ProductCatalogGroupTargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_VoucherCode]'
GO
ALTER TABLE [dbo].[uCommerce_VoucherCode] WITH NOCHECK ADD
CONSTRAINT [FK_uCommerce_VoucherCode_uCommerce_VoucherCode] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[uCommerce_VoucherTarget] ([VoucherTargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_AmountOffOrderLinesAward]'
GO
ALTER TABLE [dbo].[uCommerce_AmountOffOrderLinesAward] ADD
CONSTRAINT [FK_uCommerce_AmountOffOrderLinesAward_uCommerce_Award] FOREIGN KEY ([AmountOffOrderLinesAwardId]) REFERENCES [dbo].[uCommerce_Award] ([AwardId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_AmountOffOrderTotalAward]'
GO
ALTER TABLE [dbo].[uCommerce_AmountOffOrderTotalAward] ADD
CONSTRAINT [FK_uCommerce_AmountOffOrderTotalAward_uCommerce_Award] FOREIGN KEY ([AmountOffOrderTotalAwardId]) REFERENCES [dbo].[uCommerce_Award] ([AwardId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_AmountOffUnitAward]'
GO
ALTER TABLE [dbo].[uCommerce_AmountOffUnitAward] ADD
CONSTRAINT [FK_uCommerce_AmountOffUnitAward_uCommerce_Award] FOREIGN KEY ([AmountOffUnitAwardId]) REFERENCES [dbo].[uCommerce_Award] ([AwardId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_Award]'
GO
ALTER TABLE [dbo].[uCommerce_Award] ADD
CONSTRAINT [FK_uCommerce_Award_uCommerce_CampaignItem] FOREIGN KEY ([CampaignItemId]) REFERENCES [dbo].[uCommerce_CampaignItem] ([CampaignItemId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_CampaignItem]'
GO
ALTER TABLE [dbo].[uCommerce_CampaignItem] ADD
CONSTRAINT [FK_uCommerce_CampaignItem_uCommerce_Campaign] FOREIGN KEY ([CampaignId]) REFERENCES [dbo].[uCommerce_Campaign] ([CampaignId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_CampaignItem]'
GO
ALTER TABLE [dbo].[uCommerce_CampaignItem] ADD
CONSTRAINT [FK_uCommerce_CampaignItem_uCommerce_Definition] FOREIGN KEY ([DefinitionId]) REFERENCES [dbo].[uCommerce_Definition] ([DefinitionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO

PRINT N'Adding foreign keys to [dbo].[uCommerce_Target]'
GO
ALTER TABLE [dbo].[uCommerce_Target] ADD
CONSTRAINT [FK_uCommerce_Target_uCommerce_Target] FOREIGN KEY ([CampaignItemId]) REFERENCES [dbo].[uCommerce_CampaignItem] ([CampaignItemId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_CategoryTarget]'
GO
ALTER TABLE [dbo].[uCommerce_CategoryTarget] ADD
CONSTRAINT [FK_uCommerce_CategoryTarget_uCommerce_CategoryTarget] FOREIGN KEY ([CategoryTargetId]) REFERENCES [dbo].[uCommerce_Target] ([TargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_DefinitionTypeDescription]'
GO
ALTER TABLE [dbo].[uCommerce_DefinitionTypeDescription] ADD
CONSTRAINT [FK_DefinitionTypeDescription_uCommerce_DefinitionType] FOREIGN KEY ([DefinitionTypeId]) REFERENCES [dbo].[uCommerce_DefinitionType] ([DefinitionTypeId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_OrderLineDiscountRelation]'
GO
ALTER TABLE [dbo].[uCommerce_OrderLineDiscountRelation] ADD
CONSTRAINT [FK_uCommerce_OrderLineDiscountRelation_uCommerce_Discount] FOREIGN KEY ([DiscountId]) REFERENCES [dbo].[uCommerce_Discount] ([DiscountId]),
CONSTRAINT [FK_uCommerce_OrderLineDiscountRelation_uCommerce_OrderLine] FOREIGN KEY ([OrderLineId]) REFERENCES [dbo].[uCommerce_OrderLine] ([OrderLineId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_Discount]'
GO
ALTER TABLE [dbo].[uCommerce_Discount] ADD
CONSTRAINT [FK_uCommerce_Discount_uCommerce_PurchaseOrder] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[uCommerce_PurchaseOrder] ([OrderId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_EntityUiDescription]'
GO
ALTER TABLE [dbo].[uCommerce_EntityUiDescription] ADD
CONSTRAINT [FK_uCommerce_EntityUiDescription_uCommerce_EntityUi] FOREIGN KEY ([EntityUiId]) REFERENCES [dbo].[uCommerce_EntityUi] ([EntityUiId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_ProductCatalogTarget]'
GO
ALTER TABLE [dbo].[uCommerce_ProductCatalogTarget] ADD
CONSTRAINT [FK_uCommerce_ProductCatalogTarget_uCommerce_Target] FOREIGN KEY ([ProductCatalogTargetId]) REFERENCES [dbo].[uCommerce_Target] ([TargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_ProductTarget]'
GO
ALTER TABLE [dbo].[uCommerce_ProductTarget] ADD
CONSTRAINT [FK_uCommerce_ProductTarget_uCommerce_Target] FOREIGN KEY ([ProductTargetId]) REFERENCES [dbo].[uCommerce_Target] ([TargetId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[uCommerce_VoucherTarget]'
GO
ALTER TABLE [dbo].[uCommerce_VoucherTarget] ADD
CONSTRAINT [FK_uCommerce_VoucherTarget_uCommerce_Target] FOREIGN KEY ([VoucherTargetId]) REFERENCES [dbo].[uCommerce_Target] ([TargetId])
GO
/****** Object:  Table [dbo].[uCommerce_CampaignItemProperty]    Script Date: 03/30/2011 10:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uCommerce_CampaignItemProperty](
	[CampaignItemPropertyId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[DefinitionFieldId] [int] NOT NULL,
	[CultureCode] [nvarchar](60) NULL,
	[CampaignItemId] [int] NOT NULL,
 CONSTRAINT [PK_uCommerce_CampaignItemProperty] PRIMARY KEY CLUSTERED 
(
	[CampaignItemPropertyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  ForeignKey [FK_uCommerce_CampaignItemProperty_uCommerce_CampaignItem]    Script Date: 03/30/2011 10:04:10 ******/
ALTER TABLE [dbo].[uCommerce_CampaignItemProperty]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_CampaignItemProperty_uCommerce_CampaignItem] FOREIGN KEY([CampaignItemId])
REFERENCES [dbo].[uCommerce_CampaignItem] ([CampaignItemId])
GO
ALTER TABLE [dbo].[uCommerce_CampaignItemProperty] CHECK CONSTRAINT [FK_uCommerce_CampaignItemProperty_uCommerce_CampaignItem]
GO
/****** Object:  ForeignKey [FK_uCommerce_CampaignItemProperty_uCommerce_DefinitionField]    Script Date: 03/30/2011 10:04:10 ******/
ALTER TABLE [dbo].[uCommerce_CampaignItemProperty]  WITH CHECK ADD  CONSTRAINT [FK_uCommerce_CampaignItemProperty_uCommerce_DefinitionField] FOREIGN KEY([DefinitionFieldId])
REFERENCES [dbo].[uCommerce_DefinitionField] ([DefinitionFieldId])
GO
ALTER TABLE [dbo].[uCommerce_CampaignItemProperty] CHECK CONSTRAINT [FK_uCommerce_CampaignItemProperty_uCommerce_DefinitionField]
GO
/****** Object:  Table [dbo].[uCommerce_PercentOffShippingTotalAward]    Script Date: 03/30/2011 10:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uCommerce_PercentOffShippingTotalAward](
	[PercentOffShippingTotalAwardId] [int] NOT NULL,
	[PercentOff] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_uCommerce_PercentOffShippingAward] PRIMARY KEY CLUSTERED 
(
	[PercentOffShippingTotalAwardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[uCommerce_PercentOffOrderTotalAward]    Script Date: 03/30/2011 10:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uCommerce_PercentOffOrderTotalAward](
	[PercentOffOrderTotalAwardId] [int] NOT NULL,
	[PercentOff] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PercentOffOrderTotalAward] PRIMARY KEY CLUSTERED 
(
	[PercentOffOrderTotalAwardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[uCommerce_PercentOffOrderLinesAward]    Script Date: 03/30/2011 10:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uCommerce_PercentOffOrderLinesAward](
	[PercentOffOrderLinesAwardId] [int] NOT NULL,
	[PercentOff] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_uCommerce_ProcentOffOrderLinesAward] PRIMARY KEY CLUSTERED 
(
	[PercentOffOrderLinesAwardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE tmpErrors
GO
