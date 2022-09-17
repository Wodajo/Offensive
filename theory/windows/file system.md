#### NTFS (New Technology File System)
Before `NTFS`, there was `FAT16`/`FAT32` (`File Allocation Table`) and `HPFS` (`High Performance File System`)

You can still see `FAT` partitions in `USB devices` and `MicroSD cards`

`NTFS` is known as a `journaling file system`.
In case of a failure, the file system can *automatically repair the folders/files on disk using information stored in a log file*.
This function is not possible with `FAT`

Moreover `NTFS`:
-   supports files > 4GB
-   set `specific permissions` on folders and files
-   folder and file compression
-   encryption ([Encryption File System](https://docs.microsoft.com/en-us/windows/win32/fileio/file-encryption))
- `Alternate Data Streams` (`ADS`) - file attribute only found on the `NTFS`. Built up from a couple of attributes, one of them is `$Data`. Aside from primary data stream you can easly create alternate data streams (and abuse it to hide data)