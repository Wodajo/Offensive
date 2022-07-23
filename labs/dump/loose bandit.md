#### bandit4
`bandit4@bandit:~/inhere$ ls | xargs awk '{print "./"$1}'`
```
./�/`2ғ�%��rL~5�g���
./��p,k�;��r*��
./e�)�#��5��
            ��p��V�_���ׯ�mm
./������h!TQO�`�4"aל�߂phT��,�A
?�i�4��ו$����I&�������c���ގ.�
./�r�l$�?h�9('���!y�e�#�x�O��=��
./ly���~��A�f����-E�{���m�����ܗM
./koReBOKuIDDepwhWk7jZC0RTdopnAYKh
./�T�?�i��j���îP�F�l�n��J����{��@
./�e�0$�in=��_b�5FA�P7sz��gNT
```
`xargs` passing files to `awk`

`bandit4@bandit:~/inhere$ ls | awk '{print "./"$1}'`
```
./-file00
./-file01
./-file02
./-file03
./-file04
./-file05
./-file06
./-file07
./-file08
./-file09
```
`pipe` sending a column to `awk`

therefore:
`bandit4@bandit:~/inhere$ ls | awk '{print "./"$1}' | xargs file`

#### bandit5
`find . \( -type f -size 1033c \) ! \( -perm /111 \) -print0 2> /dev/null | xargs -0 file | grep ASCII`