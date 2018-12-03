USE [Livre]
GO
/****** Object:  Table [dbo].[book]    Script Date: 03/12/2018 11:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_oeuvre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[copy]    Script Date: 03/12/2018 11:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[copy](
	[idCopy] [int] IDENTITY(1,1) NOT NULL,
	[idBook] [int] NOT NULL,
 CONSTRAINT [PK_Exemplaire_1] PRIMARY KEY CLUSTERED 
(
	[idCopy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hasTheme]    Script Date: 03/12/2018 11:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hasTheme](
	[idtheme] [int] NOT NULL,
	[idbook] [int] NOT NULL,
 CONSTRAINT [PK_aTheme] PRIMARY KEY CLUSTERED 
(
	[idtheme] ASC,
	[idbook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hasWrite]    Script Date: 03/12/2018 11:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hasWrite](
	[idbook] [int] NOT NULL,
	[idwriter] [int] NOT NULL,
	[Realese] [datetime] NULL,
 CONSTRAINT [PK_aEcrit] PRIMARY KEY CLUSTERED 
(
	[idbook] ASC,
	[idwriter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lend]    Script Date: 03/12/2018 11:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lend](
	[idCopy] [int] NOT NULL,
	[idPeople] [int] NOT NULL,
	[dateStart] [datetime] NOT NULL,
	[dateEnd] [datetime] NULL,
 CONSTRAINT [PK_Pret] PRIMARY KEY CLUSTERED 
(
	[idCopy] ASC,
	[idPeople] ASC,
	[dateStart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[people]    Script Date: 03/12/2018 11:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[people](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[firstName] [nvarchar](max) NULL,
	[login] [nvarchar](max) NULL,
	[pwd] [nvarchar](max) NULL,
 CONSTRAINT [PK_Personne] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theme]    Script Date: 03/12/2018 11:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameTheme] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[writer]    Script Date: 03/12/2018 11:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[writer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[firstName] [nvarchar](max) NULL,
	[birthday] [datetime] NULL,
 CONSTRAINT [PK_Auteur] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[copy]  WITH CHECK ADD  CONSTRAINT [FK_Exemplaire_oeuvre] FOREIGN KEY([idBook])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[copy] CHECK CONSTRAINT [FK_Exemplaire_oeuvre]
GO
ALTER TABLE [dbo].[hasTheme]  WITH CHECK ADD  CONSTRAINT [FK_aTheme_oeuvre] FOREIGN KEY([idbook])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[hasTheme] CHECK CONSTRAINT [FK_aTheme_oeuvre]
GO
ALTER TABLE [dbo].[hasTheme]  WITH CHECK ADD  CONSTRAINT [FK_aTheme_theme] FOREIGN KEY([idtheme])
REFERENCES [dbo].[Theme] ([id])
GO
ALTER TABLE [dbo].[hasTheme] CHECK CONSTRAINT [FK_aTheme_theme]
GO
ALTER TABLE [dbo].[hasWrite]  WITH CHECK ADD  CONSTRAINT [FK_aEcrit_Auteur] FOREIGN KEY([idwriter])
REFERENCES [dbo].[writer] ([id])
GO
ALTER TABLE [dbo].[hasWrite] CHECK CONSTRAINT [FK_aEcrit_Auteur]
GO
ALTER TABLE [dbo].[hasWrite]  WITH CHECK ADD  CONSTRAINT [FK_aEcrit_idOeuvre] FOREIGN KEY([idbook])
REFERENCES [dbo].[book] ([id])
GO
ALTER TABLE [dbo].[hasWrite] CHECK CONSTRAINT [FK_aEcrit_idOeuvre]
GO
ALTER TABLE [dbo].[lend]  WITH CHECK ADD  CONSTRAINT [FK_Pret_idExemplaire] FOREIGN KEY([idCopy])
REFERENCES [dbo].[copy] ([idCopy])
GO
ALTER TABLE [dbo].[lend] CHECK CONSTRAINT [FK_Pret_idExemplaire]
GO
ALTER TABLE [dbo].[lend]  WITH CHECK ADD  CONSTRAINT [FK_Pret_idPersonne] FOREIGN KEY([idPeople])
REFERENCES [dbo].[people] ([id])
GO
ALTER TABLE [dbo].[lend] CHECK CONSTRAINT [FK_Pret_idPersonne]
GO
