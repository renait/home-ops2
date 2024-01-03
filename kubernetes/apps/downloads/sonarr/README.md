# Sonarr

## Media Management

### Episodes

#### Standard Episode Format

Default:

```
{Series Title} - {season}x{episode:00} - {Episode Title} {Quality Title}
```

Trashguides:

```
{Series TitleYear} - S{season:00}E{episode:00} - {Episode CleanTitle} [{Custom Formats }{Quality Full}]{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}
```

#### Daily Episode Format

Default:

```
{Series Title} - {Air-Date} - {Episode Title} {Quality Title}
```

Trashguides:

```
{Series TitleYear} - {Air-Date} - {Episode CleanTitle} [{Custom Formats }{Quality Full}]{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}
```

#### Anime Episode Format

Default:
```
{Series Title} - {season}x{episode:00} - {Episode Title} {Quality Title}
```

Trashguides:

```
{Series TitleYear} - S{season:00}E{episode:00} - {absolute:000} - {Episode CleanTitle} [{Custom Formats }{Quality Full}]{[MediaInfo VideoDynamicRangeType]}[{MediaInfo VideoBitDepth}bit]{[MediaInfo VideoCodec]}[{Mediainfo AudioCodec} { Mediainfo AudioChannels}]{MediaInfo AudioLanguages}{-Release Group}
```

### Folders

#### Series Folder Format

Default:
```
{Series Title}
```

Trahsguides (Plex):
```
{Series TitleYear} {imdb-{ImdbId}}
```

#### Season Folder Format

Leave at default!

```
Season {season:00}
```

#### Multi-Episode Style

Peefixed Range
