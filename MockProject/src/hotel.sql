USE [Hotel]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[birthdate] [date] NULL,
	[password] [nvarchar](100) NOT NULL,
	[idenity_number] [nvarchar](50) NOT NULL,
	[phone_number] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK__Account__46A222CDA5A6CF4B] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_roles]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_roles](
	[account_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Service]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Service](
	[booking_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Book_Service] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC,
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[room_id] [int] NULL,
	[startdate] [date] NOT NULL,
	[enddate] [date] NOT NULL,
	[price] [float] NULL,
	[number_people] [int] NULL,
	[id_customer] [int] NOT NULL,
 CONSTRAINT [PK__Booking__5DE3A5B19C6CAA74] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id_customer] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[identity_number] [varchar](10) NULL,
	[phone] [varchar](10) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[categoryroomid] [int] NULL,
	[room_number] [nvarchar](10) NOT NULL,
	[status] [nvarchar](20) NULL,
	[price] [float] NULL,
	[description] [nvarchar](500) NULL,
	[image] [nvarchar](200) NULL,
 CONSTRAINT [PK__Room__19675A8A1569BA04] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Category]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Category](
	[categoryroomid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](50) NOT NULL,
	[capacity] [int] NULL,
 CONSTRAINT [PK__RoomCate__7E472120B0D475A9] PRIMARY KEY CLUSTERED 
(
	[categoryroomid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[service_name] [nvarchar](50) NOT NULL,
	[price] [money] NULL,
	[description] [nvarchar](500) NULL,
	[image] [nvarchar](200) NULL,
 CONSTRAINT [PK__Service__3E0DB8AF57CB715C] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_Category]    Script Date: 4/14/2021 12:58:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK__Service___D54EE9B4FCD6D17A] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [full_name], [username], [birthdate], [password], [idenity_number], [phone_number], [email]) VALUES (1, N'Ha Minh Tri', N'admin', CAST(N'2000-01-21' AS Date), N'$2a$10$VtKA8kneXsOQ1h6qdcud/.Ic4O.NxbRTZ37iSSgkCLLR9WhDw8r4W', N'201796004', N'0936038027', N'tri@gmail.com')
INSERT [dbo].[Account] ([account_id], [full_name], [username], [birthdate], [password], [idenity_number], [phone_number], [email]) VALUES (7, N'Kevin', N'kevin12345', CAST(N'2021-01-12' AS Date), N'$2a$10$lT2JQyeKdt4K.jVyers2O.x3C.eRtto6jX7ldnq/p.wPJuK691zKu', N'123456789', N'0936038025', N'adi@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Account_roles] ([account_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[Account_roles] ([account_id], [role_id]) VALUES (1, 2)
INSERT [dbo].[Account_roles] ([account_id], [role_id]) VALUES (7, 2)
INSERT [dbo].[Book_Service] ([booking_id], [service_id], [quantity], [price]) VALUES (1, 3, 1, 4)
INSERT [dbo].[Book_Service] ([booking_id], [service_id], [quantity], [price]) VALUES (2, 1, 4, 4)
INSERT [dbo].[Book_Service] ([booking_id], [service_id], [quantity], [price]) VALUES (2, 4, 3, 15)
INSERT [dbo].[Book_Service] ([booking_id], [service_id], [quantity], [price]) VALUES (2, 5, 2, 10)
INSERT [dbo].[Book_Service] ([booking_id], [service_id], [quantity], [price]) VALUES (5, 1, 5, 5)
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([booking_id], [account_id], [room_id], [startdate], [enddate], [price], [number_people], [id_customer]) VALUES (1, 1, 1, CAST(N'2021-04-06' AS Date), CAST(N'2021-04-10' AS Date), 80, 1, 1)
INSERT [dbo].[Booking] ([booking_id], [account_id], [room_id], [startdate], [enddate], [price], [number_people], [id_customer]) VALUES (2, 1, 5, CAST(N'2021-03-02' AS Date), CAST(N'2021-03-18' AS Date), 560, 3, 2)
INSERT [dbo].[Booking] ([booking_id], [account_id], [room_id], [startdate], [enddate], [price], [number_people], [id_customer]) VALUES (3, 1, 3, CAST(N'2021-04-01' AS Date), CAST(N'2021-04-29' AS Date), 700, 1, 1)
INSERT [dbo].[Booking] ([booking_id], [account_id], [room_id], [startdate], [enddate], [price], [number_people], [id_customer]) VALUES (4, 1, 8, CAST(N'2021-01-01' AS Date), CAST(N'2021-01-15' AS Date), 350, 2, 3)
INSERT [dbo].[Booking] ([booking_id], [account_id], [room_id], [startdate], [enddate], [price], [number_people], [id_customer]) VALUES (5, 1, 5, CAST(N'2021-04-15' AS Date), CAST(N'2021-04-23' AS Date), 280, 4, 4)
INSERT [dbo].[Booking] ([booking_id], [account_id], [room_id], [startdate], [enddate], [price], [number_people], [id_customer]) VALUES (6, 1, 8, CAST(N'2021-04-12' AS Date), CAST(N'2021-05-04' AS Date), 550, 2, 5)
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id_customer], [name], [identity_number], [phone]) VALUES (1, N'QuocHuy', N'201876445', N'092338027')
INSERT [dbo].[Customer] ([id_customer], [name], [identity_number], [phone]) VALUES (2, N'MinhHuy', N'201923445', N'090516322')
INSERT [dbo].[Customer] ([id_customer], [name], [identity_number], [phone]) VALUES (3, N'MinhFat', N'209844551', N'122341343')
INSERT [dbo].[Customer] ([id_customer], [name], [identity_number], [phone]) VALUES (4, N'Lam', N'201897623', N'090617322')
INSERT [dbo].[Customer] ([id_customer], [name], [identity_number], [phone]) VALUES (5, N'MinhTue', N'201898772', N'412434154')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'ADMIN')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'STAFF')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (1, 1, N'A1001', N'Available', 20, N'no smoking', N'phong1.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (2, 5, N'A1002', N'Available', 25, N'', N'phong2.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (3, 3, N'A1003', N'Booked', 25, N'no smoking', N'phong4.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (4, 3, N'A1004', N'Available', 30, N'no smoking', N'phong6.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (5, 4, N'B1001', N'Checkin', 35, N'', N'phong5.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (7, 4, N'B1002', N'Available', 30, N'', N'phong2.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (8, 3, N'B1003', N'Available', 25, N'', N'phong4.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (9, 6, N'B1004', N'Available', 40, N'two TV', N'phong5.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (10, 1, N'C1001', N'Available', 30, N'Breakfast free', N'phong1.png')
INSERT [dbo].[Room] ([room_id], [categoryroomid], [room_number], [status], [price], [description], [image]) VALUES (11, 6, N'C9999', N'Available', 50, N'', N'19jnmuqkzpi21.jpg')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Room_Category] ON 

INSERT [dbo].[Room_Category] ([categoryroomid], [categoryname], [capacity]) VALUES (1, N'Single Room', 1)
INSERT [dbo].[Room_Category] ([categoryroomid], [categoryname], [capacity]) VALUES (3, N'Couple', 2)
INSERT [dbo].[Room_Category] ([categoryroomid], [categoryname], [capacity]) VALUES (4, N'Family', 4)
INSERT [dbo].[Room_Category] ([categoryroomid], [categoryname], [capacity]) VALUES (5, N'Luxury', 2)
INSERT [dbo].[Room_Category] ([categoryroomid], [categoryname], [capacity]) VALUES (6, N'Big Family', 5)
SET IDENTITY_INSERT [dbo].[Room_Category] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([service_id], [category_id], [service_name], [price], [description], [image]) VALUES (1, 2, N'Coca cola', 1.0000, N'lon', N'coca.png')
INSERT [dbo].[Service] ([service_id], [category_id], [service_name], [price], [description], [image]) VALUES (2, 2, N'Mirinda cam', 1.0000, N'lon', N'mirinda.png')
INSERT [dbo].[Service] ([service_id], [category_id], [service_name], [price], [description], [image]) VALUES (3, 1, N'Breakfast', 4.0000, N'dia', N'breakfast.png')
INSERT [dbo].[Service] ([service_id], [category_id], [service_name], [price], [description], [image]) VALUES (4, 1, N'Dinner', 5.0000, N'dia', N'dinner.png')
INSERT [dbo].[Service] ([service_id], [category_id], [service_name], [price], [description], [image]) VALUES (5, 3, N'Spa1', 5.0000, N'2 hours', N'spa1.png')
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Service_Category] ON 

INSERT [dbo].[Service_Category] ([category_id], [category_name]) VALUES (2, N'Drink')
INSERT [dbo].[Service_Category] ([category_id], [category_name]) VALUES (1, N'Food')
INSERT [dbo].[Service_Category] ([category_id], [category_name]) VALUES (3, N'Spa')
SET IDENTITY_INSERT [dbo].[Service_Category] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A1936A6BBCC4AD73]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E6164F04E984D]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__F3DBC5721AC0C9C5]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__F3DBC5721AC0C9C5] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__F740DB5AD4BAEA9A]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__F740DB5AD4BAEA9A] UNIQUE NONCLUSTERED 
(
	[idenity_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__7DF4D7C8C429E24D]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[identity_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Room__FE22F61BFEFB711F]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Room] ADD UNIQUE NONCLUSTERED 
(
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Room_Cat__1A0D12CE59D77175]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Room_Category] ADD UNIQUE NONCLUSTERED 
(
	[categoryname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Service__4A8EDF3998015EE0]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Service] ADD UNIQUE NONCLUSTERED 
(
	[service_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Service___5189E2557A0C7345]    Script Date: 4/14/2021 12:58:03 AM ******/
ALTER TABLE [dbo].[Service_Category] ADD UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [df_Room]  DEFAULT ('Available') FOR [status]
GO
ALTER TABLE [dbo].[Account_roles]  WITH CHECK ADD  CONSTRAINT [FK__Account_r__accou__49C3F6B7] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Account_roles] CHECK CONSTRAINT [FK__Account_r__accou__49C3F6B7]
GO
ALTER TABLE [dbo].[Account_roles]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Book_Service]  WITH CHECK ADD  CONSTRAINT [FK__Book_Serv__booki__286302EC] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[Book_Service] CHECK CONSTRAINT [FK__Book_Serv__booki__286302EC]
GO
ALTER TABLE [dbo].[Book_Service]  WITH CHECK ADD  CONSTRAINT [FK__Book_Serv__servi__29572725] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Book_Service] CHECK CONSTRAINT [FK__Book_Serv__servi__29572725]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__account__24927208] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__account__24927208]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__room_id__25869641] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__room_id__25869641]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[Customer] ([id_customer])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_hir07qbcns9nhwkedjc9d1p0e] FOREIGN KEY([categoryroomid])
REFERENCES [dbo].[Room_Category] ([categoryroomid])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_hir07qbcns9nhwkedjc9d1p0e]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK__Service__categor__1B0907CE] FOREIGN KEY([category_id])
REFERENCES [dbo].[Service_Category] ([category_id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK__Service__categor__1B0907CE]
GO
