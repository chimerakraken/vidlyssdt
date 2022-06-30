CREATE TABLE [dbo].[GenreTypes] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [GenreName] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.GenreTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

