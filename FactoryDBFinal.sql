USE [master]
GO
/****** Object:  Database [Завод]    Script Date: 05.05.2022 16:08:07 ******/
CREATE DATABASE [Завод]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Завод', FILENAME = N'W:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Завод.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Завод_log', FILENAME = N'W:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Завод_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Завод] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Завод].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Завод] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Завод] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Завод] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Завод] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Завод] SET ARITHABORT OFF 
GO
ALTER DATABASE [Завод] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Завод] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Завод] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Завод] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Завод] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Завод] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Завод] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Завод] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Завод] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Завод] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Завод] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Завод] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Завод] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Завод] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Завод] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Завод] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Завод] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Завод] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Завод] SET  MULTI_USER 
GO
ALTER DATABASE [Завод] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Завод] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Завод] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Завод] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Завод] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Завод] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Завод] SET QUERY_STORE = OFF
GO
USE [Завод]
GO
/****** Object:  Table [dbo].[InvoiceOnInput]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceOnInput](
	[InvoiceID] [int] NOT NULL,
	[DetailID] [int] NOT NULL,
	[InputCount] [int] NOT NULL,
	[DateOfInput] [date] NOT NULL,
 CONSTRAINT [PK_InvoiceOnInput] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movement]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movement](
	[DetailID] [int] NOT NULL,
	[DetailName] [nvarchar](50) NOT NULL,
	[DetailCount] [int] NOT NULL,
 CONSTRAINT [PK_Movement] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceDictionary]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceDictionary](
	[DetailID] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_PriceDictionary] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequiermentOnOutput]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequiermentOnOutput](
	[RequirementID] [int] NOT NULL,
	[DetailID] [int] NOT NULL,
	[OutputCount] [int] NOT NULL,
	[DateOfOutput] [date] NOT NULL,
 CONSTRAINT [PK_RequiermentOnOutput] PRIMARY KEY CLUSTERED 
(
	[RequirementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (1, 1, 50, CAST(N'2022-04-27' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (2, 2, 25, CAST(N'2022-04-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (3, 3, 30, CAST(N'2022-04-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (4, 4, 45, CAST(N'2022-03-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (5, 5, 30, CAST(N'2022-03-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (6, 6, 65, CAST(N'2022-04-28' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (7, 7, 30, CAST(N'2022-04-22' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (8, 8, 55, CAST(N'2021-04-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (9, 6, 65, CAST(N'2022-04-28' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (10, 8, 55, CAST(N'2021-04-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (12, 11, 45, CAST(N'2022-03-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (13, 11, 45, CAST(N'2022-03-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (14, 11, 45, CAST(N'2022-03-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (15, 11, 59, CAST(N'2022-03-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (16, 12, 65, CAST(N'2022-03-26' AS Date))
INSERT [dbo].[InvoiceOnInput] ([InvoiceID], [DetailID], [InputCount], [DateOfInput]) VALUES (17, 12, 59, CAST(N'2022-03-26' AS Date))
GO
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (1, N'Балка ', 100)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (2, N'Болт ', 260)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (3, N'Винт ', 200)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (4, N'Втулка', 90)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (5, N'Гайка ', 450)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (6, N'Заглушка ', 20)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (7, N'Затвор ', 30)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (8, N'Звездочка ', 40)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (9, N'Шпонка', 400)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (10, N'Шайба', 900)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (11, N'Шпилька', 890)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (12, N'Штифт', 700)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (13, N'Колесо', 400)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (14, N'Рамка', 300)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (15, N'Планка', 105)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (16, N'Скоба', 200)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (17, N'Панель', 400)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (18, N'Уголок', 100)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (19, N'Диск', 150)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (20, N'Отвертка', 100)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (21, N'Ось', 200)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (22, N'Фиксаторы', 115)
INSERT [dbo].[Movement] ([DetailID], [DetailName], [DetailCount]) VALUES (23, N'Зубчатые колеса', 137)
GO
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (1, 120.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (2, 10.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (3, 50.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (4, 130.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (5, 35.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (6, 75.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (7, 140.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (8, 45.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (9, 15.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (10, 10.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (11, 10.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (12, 100.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (13, 40.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (14, 150.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (15, 400.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (16, 15.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (17, 50.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (18, 40.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (19, 30.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (20, 300.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (21, 90.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (22, 70.0000)
INSERT [dbo].[PriceDictionary] ([DetailID], [Price]) VALUES (23, 107.0000)
GO
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (1, 1, 30, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (2, 2, 150, CAST(N'2022-05-20' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (3, 3, 130, CAST(N'2022-05-21' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (4, 3, 130, CAST(N'2022-05-21' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (5, 5, 30, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (6, 6, 30, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (7, 7, 30, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (8, 8, 305, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (9, 8, 30, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (10, 5, 30, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (11, 5, 55, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (12, 6, 55, CAST(N'2022-05-25' AS Date))
INSERT [dbo].[RequiermentOnOutput] ([RequirementID], [DetailID], [OutputCount], [DateOfOutput]) VALUES (13, 6, 55, CAST(N'2022-05-25' AS Date))
GO
ALTER TABLE [dbo].[InvoiceOnInput]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceOnInput_Movement] FOREIGN KEY([DetailID])
REFERENCES [dbo].[Movement] ([DetailID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceOnInput] CHECK CONSTRAINT [FK_InvoiceOnInput_Movement]
GO
ALTER TABLE [dbo].[PriceDictionary]  WITH CHECK ADD  CONSTRAINT [FK_PriceDictionary_Movement] FOREIGN KEY([DetailID])
REFERENCES [dbo].[Movement] ([DetailID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceDictionary] CHECK CONSTRAINT [FK_PriceDictionary_Movement]
GO
ALTER TABLE [dbo].[RequiermentOnOutput]  WITH CHECK ADD  CONSTRAINT [FK_RequiermentOnOutput_Movement] FOREIGN KEY([DetailID])
REFERENCES [dbo].[Movement] ([DetailID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequiermentOnOutput] CHECK CONSTRAINT [FK_RequiermentOnOutput_Movement]
GO
/****** Object:  StoredProcedure [dbo].[AddDetail]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Добавляет новую деталь>
-- =============================================
CREATE PROCEDURE [dbo].[AddDetail] 	
@DetailID int,
@DetailName nvarchar(50),
@DetailCount int
AS
BEGIN	
	SET NOCOUNT ON;
	Insert Into Movement(DetailID, DetailName, DetailCount)
	Values (@DetailID, @DetailName, @DetailCount)
END
GO
/****** Object:  StoredProcedure [dbo].[AddDetailPrice]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Добавляет цену для новой детали>
-- =============================================
CREATE PROCEDURE [dbo].[AddDetailPrice]
@DetailID int, 
@Price money
AS
BEGIN
	SET NOCOUNT ON;
	Insert Into PriceDictionary(DetailID, Price)
	Values (@DetailID, @Price)
END
GO
/****** Object:  StoredProcedure [dbo].[AddInvoice]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Добавляет новый приход>
-- =============================================
CREATE PROCEDURE [dbo].[AddInvoice] 	
@InvoiceID int,
@DetailID int,
@InputCount int = 0,
@DateOfInput date
AS
BEGIN
	SET NOCOUNT ON;
	Insert Into InvoiceOnInput(InvoiceID, DetailID, InputCount, DateOfInput)
	Values (@InvoiceID, @DetailID, @InputCount, @DateOfInput)
END
GO
/****** Object:  StoredProcedure [dbo].[AddRequirement]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Добавляет новое требование выдачи>
-- =============================================
CREATE PROCEDURE [dbo].[AddRequirement]
@RequirementID int,
@DetailID int,
@OutputCount int = 0,
@DateOfOutput date
AS
BEGIN	
	SET NOCOUNT ON;
	Insert Into RequiermentOnOutput(RequirementID, DetailID, OutputCount, DateOfOutput)
	Values (@RequirementID, @DetailID, @OutputCount, @DateOfOutput)
END
GO
/****** Object:  StoredProcedure [dbo].[CountRemaining]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- =============================================
CREATE PROCEDURE [dbo].[CountRemaining]
AS
BEGIN
	SET NOCOUNT ON;	
	SELECT DetailName, DetailCount, (DetailCount - Requires.OutputCount) as AfterOutputCount  From Movement Left Join
	(Select DetailID, Sum(OutputCount) as OutputCount From RequiermentOnOutput Group By DetailID) as Requires
	On Movement.DetailID = Requires.DetailID
END
GO
/****** Object:  StoredProcedure [dbo].[GetDetailCost]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <05.05.2022>
-- =============================================
CREATE PROCEDURE [dbo].[GetDetailCost]
AS
BEGIN
	SET NOCOUNT ON;
	Select DetailName, (Price*DetailCount) as Cost From Movement Inner Join PriceDictionary On
	Movement.DetailID = PriceDictionary.DetailID
END
GO
/****** Object:  StoredProcedure [dbo].[GetDetailCostOnRequirement]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- =============================================
CREATE PROCEDURE [dbo].[GetDetailCostOnRequirement]
@ReqID int
AS
BEGIN
	SET NOCOUNT ON;
	Select RequirementID, (OutputCount * Price) as OutputPrice From RequiermentOnOutput Inner Join Movement On RequiermentOnOutput.DetailID = Movement.DetailID Inner Join PriceDictionary On Movement.DetailID = PriceDictionary.DetailID	
	Where RequirementID = @ReqID
END
GO
/****** Object:  StoredProcedure [dbo].[GetInputCountOnMonth]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- =============================================
CREATE PROCEDURE [dbo].[GetInputCountOnMonth]
@Month int
AS
BEGIN
	SET NOCOUNT ON;
	Select DetailName, Sum(InputCount) as InputCount From InvoiceOnInput Inner Join Movement On InvoiceOnInput.DetailID = Movement.DetailID
	Group By InvoiceOnInput.DetailID, DetailName, DateOfInput
	Having Month(DateOfInput) = @Month
END
GO
/****** Object:  StoredProcedure [dbo].[GetNameOfDetail]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- =============================================
CREATE PROCEDURE [dbo].[GetNameOfDetail]
AS
BEGIN	
	SET NOCOUNT ON;	
	Select Movement.DetailName From Movement Inner Join RequiermentOnOutput On Movement.DetailID = RequiermentOnOutput.DetailID, (Select Max(RequiermentOnOutput.OutputCount) as maximum From RequiermentOnOutput) as Maximum
	Where Maximum.maximum = RequiermentOnOutput.OutputCount
END
GO
/****** Object:  StoredProcedure [dbo].[MainDetailInfo]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <28.04.2022>
-- Description:	<ForMainInfo>
-- =============================================
CREATE PROCEDURE [dbo].[MainDetailInfo]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Movement.DetailID, DetailName, DetailCount, Price From Movement Inner join PriceDictionary on Movement.DetailID = PriceDictionary.DetailID
END
GO
/****** Object:  StoredProcedure [dbo].[MovementOnDate]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- =============================================
CREATE PROCEDURE [dbo].[MovementOnDate]
@Date date
AS
BEGIN
	SET NOCOUNT ON;
	Select DetailName, DateOfInput, InputCount, Reqs.DateOfOutput, Reqs.OutputCount From InvoiceOnInput Right Outer Join Movement On InvoiceOnInput.DetailID = Movement.DetailID 
	Left Outer Join (Select * From RequiermentOnOutput Where DateOfOutput = @Date) as Reqs On Movement.DetailID = Reqs.DetailID
		Where InvoiceOnInput.DateOfInput = @Date Or Reqs.DateOfOutput = @Date

END
GO
/****** Object:  StoredProcedure [dbo].[RemoveDetail]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Удаляет деталь по ID>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveDetail]
@DetailID int
AS
BEGIN
	SET NOCOUNT ON;
	Delete From Movement Where DetailID = @DetailID
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveDetailPrice]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Удаляет цену у конкретной детали по ID>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveDetailPrice] 
@DetailID int
AS
BEGIN	
	SET NOCOUNT ON;
	Delete From PriceDictionary Where DetailID = @DetailID
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveInvoice]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Удаляет приход>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveInvoice]
@InvoiceID int
AS
BEGIN
	SET NOCOUNT ON;
	Delete From InvoiceOnInput Where InvoiceID = @InvoiceID
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveRequirement]    Script Date: 05.05.2022 16:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hapro Bishop>
-- Create date: <29.04.2022>
-- Description:	<Удаляет требование по ID>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveRequirement]
@RequirementID int
AS
BEGIN	
	SET NOCOUNT ON;
	Delete From RequiermentOnOutput Where RequirementID = @RequirementID
END
GO
USE [master]
GO
ALTER DATABASE [Завод] SET  READ_WRITE 
GO
