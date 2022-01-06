/****** Object:  Table [dbo].[Account]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ServicePhone] [nvarchar](20) NULL,
	[StripeCustomerId] [nvarchar](50) NULL,
	[StripeSubscriptionId] [nvarchar](50) NULL,
	[Status] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY NONCLUSTERED 
(
	[AccountId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[Body] [nvarchar](250) NOT NULL,
	[SendDate] [datetime] NOT NULL,
	[PlaceId] [uniqueidentifier] NULL,
	[Status] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY NONCLUSTERED 
(
	[CampaignId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignGroup]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignGroup](
	[CampaignId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CampaignGroup] PRIMARY KEY NONCLUSTERED 
(
	[CampaignId] ASC,
	[GroupId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NOT NULL,
	[WelcomeSent] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY NONCLUSTERED 
(
	[ContactId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_Contact] UNIQUE NONCLUSTERED 
(
	[AccountId] ASC,
	[Phone] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactGroup]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactGroup](
	[ContactId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ContactGroup] PRIMARY KEY NONCLUSTERED 
(
	[ContactId] ASC,
	[GroupId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[System] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY NONCLUSTERED 
(
	[GroupId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[PlaceId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[GooglePlaceId] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY NONCLUSTERED 
(
	[PlaceId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanId] [nvarchar](50) NOT NULL,
	[Order] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Package] [int] NOT NULL,
	[MonthlyPrice] [decimal](10, 2) NOT NULL,
	[OveragePrice] [decimal](10, 4) NOT NULL,
	[StripeMonthlyPlanId] [nvarchar](50) NOT NULL,
	[StripeOveragePlanId] [nvarchar](50) NOT NULL,
	[Public] [bit] NOT NULL,
 CONSTRAINT [PK_Plan_1] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 9/9/2021 11:05:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[ReferenceId] [nvarchar](50) NULL,
	[Direction] [nvarchar](20) NOT NULL,
	[From] [nvarchar](20) NOT NULL,
	[To] [nvarchar](20) NOT NULL,
	[Body] [nvarchar](500) NULL,
	[CampaignId] [uniqueidentifier] NULL,
	[UniqueCode] [nvarchar](20) NULL,
	[Rating] [int] NULL,
	[Segments] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY NONCLUSTERED 
(
	[MessageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/9/2021 11:04:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordMd5] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](250) NOT NULL,
	[PasswordSalt] [nvarchar](250) NOT NULL,
	[SecureCode] [nvarchar](250) NULL,
	[ExpiresSecureCode] [datetime] NULL,
	[AccountOwner] [bit] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [RefPlace] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Place] ([PlaceId])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [RefPlace]
GO
ALTER TABLE [dbo].[CampaignGroup]  WITH CHECK ADD  CONSTRAINT [RefCampaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaign] ([CampaignId])
GO
ALTER TABLE [dbo].[CampaignGroup] CHECK CONSTRAINT [RefCampaign]
GO
ALTER TABLE [dbo].[CampaignGroup]  WITH CHECK ADD  CONSTRAINT [RefGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[CampaignGroup] CHECK CONSTRAINT [RefGroup]
GO
ALTER TABLE [dbo].[ContactGroup]  WITH CHECK ADD  CONSTRAINT [FK_ContactGroup_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[ContactGroup] CHECK CONSTRAINT [FK_ContactGroup_Contact]
GO
ALTER TABLE [dbo].[ContactGroup]  WITH CHECK ADD  CONSTRAINT [FK_ContactGroup_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[ContactGroup] CHECK CONSTRAINT [FK_ContactGroup_Group]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Account]
GO
