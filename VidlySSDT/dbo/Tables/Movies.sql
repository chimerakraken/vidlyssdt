CREATE TABLE [dbo].[Movies] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [MovieName]     NVARCHAR (MAX) NOT NULL,
    [ReleaseDate]   DATETIME       DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    [NumberInStock] INT            DEFAULT ((0)) NOT NULL,
    [GenreTypeId]   INT            DEFAULT ((0)) NOT NULL,
    [MoviePrice]    FLOAT (53)     DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.Movies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Movies_dbo.GenreTypes_GenreTypeId] FOREIGN KEY ([GenreTypeId]) REFERENCES [dbo].[GenreTypes] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_GenreTypeId]
    ON [dbo].[Movies]([GenreTypeId] ASC);

