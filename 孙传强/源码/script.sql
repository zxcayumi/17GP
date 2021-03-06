USE [ZDGL]
GO
/****** Object:  Table [dbo].[Device_CardDispenser]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_CardDispenser](
	[ID] [nvarchar](20) NOT NULL,
	[Pattern] [nvarchar](50) NULL,
	[Remark] [nvarchar](10) NULL,
	[Port] [nvarchar](20) NULL,
	[Baud] [int] NULL,
	[CardType] [nvarchar](10) NULL,
	[RFCardType] [nvarchar](10) NULL,
	[RFCardPwd] [nvarchar](20) NULL,
	[RFCardPwdType] [nvarchar](10) NULL,
	[RFCardSectionIndex] [int] NULL,
	[RFCardBlockIndex] [int] NULL,
	[MagneticCardIndex] [int] NULL,
	[CardNoStart] [int] NULL,
	[CardNoLen] [int] NULL,
	[Memo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Device_CardDispenser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Device_CardReader]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_CardReader](
	[ID] [nvarchar](20) NOT NULL,
	[Pattern] [nvarchar](50) NULL,
	[Remark] [nvarchar](20) NULL,
	[Port] [nvarchar](20) NULL,
	[Baud] [int] NULL,
	[CardType] [nvarchar](20) NULL,
	[RFCardType] [nvarchar](20) NULL,
	[RFCardPwd] [nvarchar](20) NULL,
	[RFCardPwdType] [nvarchar](20) NULL,
	[RFCardSectionIndex] [int] NULL,
	[RFCardBlockIndex] [int] NULL,
	[MagneticCardIndex] [int] NULL,
	[CardNoStart] [int] NULL,
	[CardNoLen] [int] NULL,
	[Memo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Device_IDReader]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_IDReader](
	[ID] [nvarchar](20) NOT NULL,
	[Pattern] [nvarchar](50) NULL,
	[Remark] [nvarchar](30) NULL,
	[Port] [nvarchar](20) NULL,
	[Baud] [int] NULL,
	[Memo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Device_Info]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_Info](
	[DeviceID] [nvarchar](20) NOT NULL,
	[DeviceNo] [nvarchar](20) NULL,
	[Pattern] [nvarchar](30) NULL,
	[Memo] [nvarchar](50) NULL,
	[CardDispenser] [nvarchar](50) NULL,
	[CardDispenserID] [nvarchar](30) NULL,
	[CardReader] [nvarchar](50) NULL,
	[CardReaderID] [nvarchar](30) NULL,
	[IDReader] [nvarchar](50) NULL,
	[IDReaderID] [nvarchar](30) NULL,
	[ThermalPrinter] [nvarchar](50) NULL,
	[ThermalPrinterID] [nvarchar](30) NULL,
	[PaperPrinter] [nvarchar](50) NULL,
	[PaperPrinterID] [nvarchar](30) NULL,
	[CreateTime] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Device_PaperPrinter]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_PaperPrinter](
	[ID] [nvarchar](20) NOT NULL,
	[Pattern] [nvarchar](50) NULL,
	[Remark] [nvarchar](20) NULL,
	[Port] [nvarchar](20) NULL,
	[Baud] [int] NULL,
	[HospitalName] [nvarchar](20) NULL,
	[Memo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Device_ThermalPrinter]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_ThermalPrinter](
	[ID] [nvarchar](20) NOT NULL,
	[Pattern] [nvarchar](50) NULL,
	[Remark] [nvarchar](10) NULL,
	[Port] [nvarchar](20) NULL,
	[Baud] [int] NULL,
	[HospitalName] [nvarchar](30) NULL,
	[Memo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Info_BankCard]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_BankCard](
	[BankCardNo] [nvarchar](20) NOT NULL,
	[EndDate] [nchar](10) NOT NULL,
	[Exchangecode] [nchar](10) NULL,
	[ServiceCode] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Info_IDCard]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_IDCard](
	[Name] [nvarchar](10) NOT NULL,
	[Sex] [nvarchar](4) NOT NULL,
	[Nation] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[IDNo] [nvarchar](18) NOT NULL,
	[Mobile] [nchar](11) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[ExpireDay] [date] NOT NULL,
	[PhotoUrl] [image] NULL,
 CONSTRAINT [PK_IDCard] PRIMARY KEY CLUSTERED 
(
	[IDNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Info_SocialCard]    Script Date: 2021/4/17 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Info_SocialCard](
	[CardID] [varchar](20) NOT NULL,
	[CardType] [varchar](50) NULL,
	[CardVersion] [varchar](50) NULL,
	[OrgNum] [varchar](50) NULL,
	[IssueDate] [varchar](50) NULL,
	[CardPeriod] [varchar](50) NULL,
	[CardNum] [varchar](50) NULL,
	[SocialID] [varchar](20) NULL,
	[Name] [varchar](10) NULL,
	[NameEx] [varchar](10) NULL,
	[Sex] [varchar](4) NULL,
	[Nation] [varchar](20) NULL,
	[Address] [varchar](50) NULL,
	[Birthday] [varchar](20) NULL,
 CONSTRAINT [PK_Info_SocialCard] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'Pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实现类的后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'波特率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'Baud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡型:射频卡、磁条卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'CardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡类型TypeA,TypeB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'RFCardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'RFCardPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡密码类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'RFCardPwdType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡扇区索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'RFCardSectionIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡块索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'RFCardBlockIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'磁条卡磁道索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'MagneticCardIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号起始位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'CardNoStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'CardNoLen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardDispenser', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'Pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实现类的后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'波特率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'Baud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡型:射频卡、磁条卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'CardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡类型TypeA,TypeB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'RFCardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'RFCardPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡密码类型(KeyA,KeyB)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'RFCardPwdType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡扇区索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'RFCardSectionIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡块索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'RFCardBlockIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'磁条卡磁道索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'MagneticCardIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号起始位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'CardNoStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'CardNoLen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_CardReader', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_IDReader', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_IDReader', @level2type=N'COLUMN',@level2name=N'Pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实现类的后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_IDReader', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_IDReader', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'波特率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_IDReader', @level2type=N'COLUMN',@level2name=N'Baud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_IDReader', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'DeviceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'终端编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'DeviceNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备型号（关联字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'Pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡器型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'CardDispenser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡器型号编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'CardDispenserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读卡器型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'CardReader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'读卡器型号编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'CardReaderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'IDReader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证型号编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'IDReaderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热敏打印型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'ThermalPrinter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热敏打印型号编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'ThermalPrinterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'化验单打印型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'PaperPrinter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'化验单打印型号编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'PaperPrinterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_Info', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_PaperPrinter', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_PaperPrinter', @level2type=N'COLUMN',@level2name=N'Pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实现类的后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_PaperPrinter', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_PaperPrinter', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'波特率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_PaperPrinter', @level2type=N'COLUMN',@level2name=N'Baud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医院名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_PaperPrinter', @level2type=N'COLUMN',@level2name=N'HospitalName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_PaperPrinter', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡器编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_ThermalPrinter', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_ThermalPrinter', @level2type=N'COLUMN',@level2name=N'Pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实现类的后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_ThermalPrinter', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_ThermalPrinter', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'波特率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_ThermalPrinter', @level2type=N'COLUMN',@level2name=N'Baud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'医院名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_ThermalPrinter', @level2type=N'COLUMN',@level2name=N'HospitalName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Device_ThermalPrinter', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_BankCard', @level2type=N'COLUMN',@level2name=N'BankCardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'失效日期（YYMM）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_BankCard', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交换控制符
0无限制、2限制在国内跨系统、3限制在省内跨系统、4限制在市内跨系统5限制在国内系统内、6限制在省内系统内、7限制在市内系统内、8管理卡不适用于交换、9系统测试卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_BankCard', @level2type=N'COLUMN',@level2name=N'Exchangecode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务代码：
01无限制、02无自动柜员机服务、02只有自动柜员机服务、10无现金预支、11无现金预支又无自动柜员机服务、20要求肯定授权：所有授权应由发卡行或代理人认可、21集成电路卡：无限制、23集成电路卡：只有自动柜员机服务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_BankCard', @level2type=N'COLUMN',@level2name=N'ServiceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'民族' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'Nation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'IDNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发证机关' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'ExpireDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_IDCard', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡的识别码(保留字段)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'CardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'CardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规范版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'CardVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'初始化机构编码（保留字段）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'OrgNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发卡日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'IssueDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'CardPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'CardNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'社会保障卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'SocialID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名扩展(保留字段)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'NameEx'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'民族' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'Nation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生地(保留字段)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SocialCard', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
