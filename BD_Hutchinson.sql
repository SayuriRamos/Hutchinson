USE [Hutchinson]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 11/10/2021 10:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[perfil_id] [int] NOT NULL,
	[nombrePerfil] [varchar](50) NOT NULL,
 CONSTRAINT [PK_perfil] PRIMARY KEY CLUSTERED 
(
	[perfil_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfil_permiso]    Script Date: 11/10/2021 10:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil_permiso](
	[perfil_id] [int] NOT NULL,
	[id_permiso] [int] NOT NULL,
 CONSTRAINT [PK_perfil_permiso] PRIMARY KEY CLUSTERED 
(
	[perfil_id] ASC,
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 11/10/2021 10:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/10/2021 10:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[NoEmpleado] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[Foto] [image] NULL,
	[Correo] [varchar](50) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Planta] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[Perfil] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[NoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosJwtRefreshTokens]    Script Date: 11/10/2021 10:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosJwtRefreshTokens](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NoEmp] [varchar](50) NULL,
	[RefreshTokenSessionId] [varchar](50) NULL,
	[Ip] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[Revoked] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpirityAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Perfil] ([perfil_id], [nombrePerfil]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[User] ([NoEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Foto], [Correo], [Departamento], [Planta], [Usuario], [Contrasena], [Perfil]) VALUES (N'1', N'Armando', N'Cardenas', N'Florido', NULL, N'armando.cardenas@cetys.mx', N'Sistemas', N'Ensenada', N'armandoc', N'contrasena', 1)
INSERT [dbo].[User] ([NoEmpleado], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Foto], [Correo], [Departamento], [Planta], [Usuario], [Contrasena], [Perfil]) VALUES (N'2', N'Sayuri', N'Ramos', N'Higuera', NULL, N'sayuri@correo.com', N'Sistemas', N'Ensenada', N'sayuri', N'contrasena', 1)
GO
SET IDENTITY_INSERT [dbo].[UsuariosJwtRefreshTokens] ON 

INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (1, N'1', N'0c4fb927-f580-4fc9-b7d2-83e4610ec9fe', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T21:15:05.117' AS DateTime), CAST(N'2021-11-01T21:15:05.117' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (2, N'1', N'ae1c2911-6b55-464f-b730-76262a12b763', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T21:26:33.963' AS DateTime), CAST(N'2021-11-01T21:26:33.963' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (3, N'1', N'b6dfd209-61a8-48cb-87c2-b7ac52787d68', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T21:30:57.490' AS DateTime), CAST(N'2021-11-01T21:30:57.490' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (4, N'1', N'6a0fa7f2-1e43-4612-a9e9-be2b0e1ec391', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T22:13:05.770' AS DateTime), CAST(N'2021-11-01T22:13:05.770' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (5, N'1', N'92861394-20eb-442b-8d8f-309fb4de680c', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-01T22:35:55.247' AS DateTime), CAST(N'2021-11-01T22:35:55.247' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (6, N'2', N'ba248056-171b-4c88-b0e2-e17e7eb1f75e', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-05T09:31:47.017' AS DateTime), CAST(N'2021-11-05T09:31:47.017' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (7, N'2', N'1775d526-03f7-42a6-a32b-274b819c039f', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-05T09:33:35.343' AS DateTime), CAST(N'2021-11-05T09:33:35.343' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (8, N'2', N'fc69e335-1682-4167-99b3-b511de5785d2', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-05T17:03:25.100' AS DateTime), CAST(N'2021-11-05T17:03:25.100' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (9, N'2', N'7330123b-129c-45e0-91d4-31acf81d1a16', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:42:24.517' AS DateTime), CAST(N'2021-11-07T17:42:24.517' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (11, N'2', N'3b8760c9-f0cb-48e4-9d3d-1f4612ef8453', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:43:43.007' AS DateTime), CAST(N'2021-11-07T17:43:43.007' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (13, N'2', N'97f00d75-0730-42f0-ad9a-5de75c91a37d', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:46:05.483' AS DateTime), CAST(N'2021-11-07T17:46:05.483' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (15, N'2', N'4a4e222c-2a1c-495e-b447-fa06def64f6b', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:49:52.907' AS DateTime), CAST(N'2021-11-07T17:49:52.907' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (18, N'2', N'12663984-04af-4205-809a-807453e9db48', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:56:02.737' AS DateTime), CAST(N'2021-11-07T17:56:02.737' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (20, N'2', N'5042f8e3-3b67-4721-a20a-29114979fe22', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:59:51.543' AS DateTime), CAST(N'2021-11-07T17:59:51.543' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (21, N'2', N'3ff4bd7a-10ac-40a9-804d-891b16ff1305', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-08T17:30:58.170' AS DateTime), CAST(N'2021-11-08T17:30:58.170' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (22, N'2', N'82d315ec-ef0b-4af1-b1d2-0f69742abfba', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-08T17:31:54.820' AS DateTime), CAST(N'2021-11-08T17:31:54.820' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (24, N'2', N'a32382ee-6f39-4a9c-b2df-1fbb440c5aae', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-08T17:58:36.390' AS DateTime), CAST(N'2021-11-08T17:58:36.390' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (27, N'2', N'4262dc1f-7e7c-40c5-80bb-efbf1da817f0', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-10T00:34:10.880' AS DateTime), CAST(N'2021-11-10T00:34:10.880' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (29, N'2', N'b3b56f1e-0185-4cbb-8ec8-3f88bd5821d9', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-10T16:16:01.780' AS DateTime), CAST(N'2021-11-10T16:16:01.780' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (30, N'2', N'a3786bd3-0694-4619-8cb9-9295d79939a1', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-10T16:43:51.767' AS DateTime), CAST(N'2021-11-10T16:43:51.767' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (31, N'2', N'50b93ae1-3801-4b16-a384-928a7f3d497a', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-10T16:54:33.490' AS DateTime), CAST(N'2021-11-10T16:54:33.490' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (32, N'2', N'549e945b-6120-42df-82f7-b45b76ee5d75', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-10T17:07:28.487' AS DateTime), CAST(N'2021-11-10T17:07:28.487' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (34, N'2', N'23ff8c6f-e28c-4fc2-a78e-03acc65a85e6', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-10T17:09:20.403' AS DateTime), CAST(N'2021-11-10T17:09:20.403' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (35, N'2', N'0759a556-7276-42fa-bf0b-6bbdd68211f2', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-10T17:20:34.843' AS DateTime), CAST(N'2021-11-10T17:20:34.843' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (10, N'2', N'8579bcc8-7c14-4521-a955-50ea2e32e4c0', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:42:50.537' AS DateTime), CAST(N'2021-11-07T17:42:50.537' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (12, N'2', N'3b4ea97b-4ada-43e0-bf54-799aebdf87e0', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:44:51.460' AS DateTime), CAST(N'2021-11-07T17:44:51.460' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (14, N'2', N'5d483691-fb70-472c-a808-6e2c427532a9', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:47:58.853' AS DateTime), CAST(N'2021-11-07T17:47:58.853' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (16, N'2', N'966235ae-65cd-4d9a-94b4-1ad45761c9e1', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:52:06.570' AS DateTime), CAST(N'2021-11-07T17:52:06.570' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (19, N'2', N'9323308f-247b-4c2d-83cc-577940ebe875', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:56:43.907' AS DateTime), CAST(N'2021-11-07T17:56:43.907' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (23, N'2', N'82af6199-9e58-4660-bffe-35bc28350503', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-08T17:33:46.203' AS DateTime), CAST(N'2021-11-08T17:33:46.203' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (25, N'2', N'65bc5af5-d6d2-457f-b4f7-7c55a1067e76', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-08T17:59:08.777' AS DateTime), CAST(N'2021-11-08T17:59:08.777' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (26, N'2', N'c2ca76b0-3e66-4c6b-8dec-9c6c95ea05eb', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-08T18:02:33.650' AS DateTime), CAST(N'2021-11-08T18:02:33.650' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (28, N'2', N'e1338658-4265-4b75-9c60-27aa9ab88291', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-10T16:15:48.843' AS DateTime), CAST(N'2021-11-10T16:15:48.843' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (33, N'2', N'c48929dd-93f2-4003-8e2d-66e0f512fd8e', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-10T17:07:51.677' AS DateTime), CAST(N'2021-11-10T17:07:51.677' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (36, N'2', N'fe285d14-ae6b-4b8e-885a-c67c153ea033', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-10T17:26:06.330' AS DateTime), CAST(N'2021-11-10T17:26:06.330' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (37, N'2', N'6840d44d-61ac-4b9e-a182-dc7238a81467', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-10T17:28:13.210' AS DateTime), CAST(N'2021-11-10T17:28:13.210' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (38, N'2', N'4974eae5-ab11-4344-8390-4a2b1042662c', N'::1', N'hutchinson microservices', 0, CAST(N'2021-11-10T17:31:07.177' AS DateTime), CAST(N'2021-11-10T17:31:07.177' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (39, N'2', N'7e86af8c-bef3-49c8-9ea2-e34341a19afa', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-10T18:06:58.173' AS DateTime), CAST(N'2021-11-10T18:06:58.173' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (40, N'2', N'085b3863-a598-4c1d-b0de-efb1d3262717', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-10T22:26:54.537' AS DateTime), CAST(N'2021-11-10T22:26:54.537' AS DateTime))
INSERT [dbo].[UsuariosJwtRefreshTokens] ([ID], [NoEmp], [RefreshTokenSessionId], [Ip], [Source], [Revoked], [CreatedAt], [ExpirityAt]) VALUES (17, N'2', N'3eaf581f-20ab-4b7c-9ad5-6f90c1379a9a', N'127.0.0.1', N'hutchinson microservices', 0, CAST(N'2021-11-07T17:55:14.060' AS DateTime), CAST(N'2021-11-07T17:55:14.060' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuariosJwtRefreshTokens] OFF
GO
ALTER TABLE [dbo].[UsuariosJwtRefreshTokens] ADD  CONSTRAINT [DF_UsuariosJwtRefreshTokens_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[UsuariosJwtRefreshTokens] ADD  CONSTRAINT [DF_UsuariosJwtRefreshTokens_ExpirityAt]  DEFAULT (getdate()) FOR [ExpirityAt]
GO
ALTER TABLE [dbo].[perfil_permiso]  WITH CHECK ADD  CONSTRAINT [FK_perfil_permiso_perfil] FOREIGN KEY([perfil_id])
REFERENCES [dbo].[Perfil] ([perfil_id])
GO
ALTER TABLE [dbo].[perfil_permiso] CHECK CONSTRAINT [FK_perfil_permiso_perfil]
GO
ALTER TABLE [dbo].[perfil_permiso]  WITH CHECK ADD  CONSTRAINT [FK_perfil_permiso_permiso] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[Permission] ([id])
GO
ALTER TABLE [dbo].[perfil_permiso] CHECK CONSTRAINT [FK_perfil_permiso_permiso]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([Perfil])
REFERENCES [dbo].[Perfil] ([perfil_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
