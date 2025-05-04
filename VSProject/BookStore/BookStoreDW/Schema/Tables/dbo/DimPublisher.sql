CREATE TABLE [dbo].[DimPublisher]
(
	[publisherSK] INT NOT NULL IDENTITY(1,1), 
    [publisherId] INT NOT NULL, 
    [publisherName] VARCHAR(400) NULL, 
    [title] VARCHAR(400) NULL, 
    [publicationDate] DATE NULL,
    CONSTRAINT pk_Publisher PRIMARY KEY ([publisherSK])
)
