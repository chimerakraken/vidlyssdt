CREATE TABLE [dbo].[MembershipTypes] (
    [Id]                 TINYINT        IDENTITY (1, 1) NOT NULL,
    [SignUpFee]          SMALLINT       DEFAULT ((0)) NOT NULL,
    [DurationInMonths]   TINYINT        DEFAULT ((0)) NOT NULL,
    [DiscountRate]       TINYINT        DEFAULT ((0)) NOT NULL,
    [MembershipTypeName] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.MembershipTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

