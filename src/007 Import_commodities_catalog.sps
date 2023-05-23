﻿* Encoding: UTF-8.
DATASET CLOSE ALL.
GET DATA
  /TYPE=XLSX
  /FILE='data\Commodities_Catalogue_XPMI.xlsx'
  /SHEET=name 'Pauta Grupos_2023_'
  /CELLRANGE=FULL
  /READNAMES=ON
.
EXECUTE.

DELETE VARIABLES DescriçãoSH8 TO Descriptionsitcr4_3 Descriptionsitcr4_2 Descriptionsitcr4_1 TO becno.
EXECUTE.

SORT CASES BY comno.
MATCH FILES FILE=*
           /BY comno
           /FIRST = first_id
           .

FREQUENCIES first_id.

DELETE VARIABLES first_id.
RENAME VARIABLES sitcr4_1 = sitc1 sitcr4_2 = sitc2.
EXECUTE.

SAVE OUTFILE='data\commodity_sitc.sav'.




