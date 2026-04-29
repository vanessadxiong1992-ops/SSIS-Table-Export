USE [Restaurant]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 4/28/2026 7:35:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[AgeRange] [varchar](20) NULL,
	[FavoriteDishID] [int] NULL,
	[FavoriteServerID] [int] NULL,
	[FavoriteTableID] [int] NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [DateTime]
GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([FavoriteDishID])
REFERENCES [dbo].[Dishes] ([DishID])
GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([FavoriteServerID])
REFERENCES [dbo].[Servers] ([ServerID])
GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([FavoriteTableID])
REFERENCES [dbo].[RestaurantTables] ([TableID])
GO
