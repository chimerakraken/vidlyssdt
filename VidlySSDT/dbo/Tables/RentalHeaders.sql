CREATE TABLE [dbo].[RentalHeaders] (
    [Id]                  INT        IDENTITY (1, 1) NOT NULL,
    [MembershipTypeId]    TINYINT    NOT NULL,
    [RentalDate]          DATETIME   NOT NULL,
    [MoviesBorrowedQty]   INT        NOT NULL,
    [MoviesReturnedQty]   INT        NOT NULL,
    [TotalGross]          FLOAT (53) NOT NULL,
    [TotalDiscount]       FLOAT (53) NOT NULL,
    [TotalNetPrice]       FLOAT (53) NOT NULL,
    [RentalStatus]        BIT        NOT NULL,
    [customerId]          INT        DEFAULT ((0)) NOT NULL,
    [IsTransactionVoided] BIT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.RentalHeaders] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.RentalHeaders_dbo.Customers_customerId] FOREIGN KEY ([customerId]) REFERENCES [dbo].[Customers] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_CustomerId]
    ON [dbo].[RentalHeaders]([customerId] ASC);

