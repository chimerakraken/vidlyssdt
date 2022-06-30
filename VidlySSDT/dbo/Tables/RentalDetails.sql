CREATE TABLE [dbo].[RentalDetails] (
    [Id]                   INT        IDENTITY (1, 1) NOT NULL,
    [RentalHeaderId]       INT        NOT NULL,
    [MovieId]              INT        NOT NULL,
    [MovieQty]             INT        NOT NULL,
    [SubscriptionDiscount] FLOAT (53) NOT NULL,
    [Gross]                FLOAT (53) NOT NULL,
    [NetPrice]             FLOAT (53) NOT NULL,
    [IsReturned]           BIT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.RentalDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.RentalDetails_dbo.Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [dbo].[Movies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.RentalDetails_dbo.RentalHeaders_RentalHeaderId] FOREIGN KEY ([RentalHeaderId]) REFERENCES [dbo].[RentalHeaders] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_RentalHeaderId]
    ON [dbo].[RentalDetails]([RentalHeaderId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MovieId]
    ON [dbo].[RentalDetails]([MovieId] ASC);

