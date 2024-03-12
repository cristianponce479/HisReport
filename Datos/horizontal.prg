CREATE CURSOR ctemphoz (id_eess INT, idcita VARCHAR(15))
INSERT INTO ctemphoz (id_eess, idcita) SELECT DISTINCT ID_EESS, IDCITA FROM HIS3 WHERE DX='85018'
SELECT H.ID_EESS, H.IDCITA, h.DX, H.TD, H.LC, H.CORRELA FROM ctemphoz C INNER JOIN HIS3 H ON c.id_eess=h.id_eess AND c.idcita=h.idcita ;
ORDER BY H.ID_EESS, H.IDCITA, H.CORRELA INTO CURSOR ctempdx

SELECT MAX(CORRELA) as total FROM ctempdx INTO CURSOR ctempmax
maximo=ctempmax.total

FOR i=1 TO maximo
	mdx='dx' + ALLTRIM(STR(i))
	mtd='td' + ALLTRIM(STR(i))
	mlc='lc' + ALLTRIM(STR(i))
	ALTER table ctemphoz ADD COLUMN &mdx c(10)
	ALTER table ctemphoz ADD COLUMN &mtd c(1)
	ALTER table ctemphoz ADD COLUMN &mlc c(5)
NEXT

SELECT ctempdx
SCAN
	eess=ctempdx.id_eess
	cita=ctempdx.idcita
	dx=ctempdx.dx
	td=ctempdx.td
	lc=ctempdx.lc
	corre=ctempdx.correla
	ldx='dx' + ALLTRIM(STR(corre))
	ltd='td' + ALLTRIM(STR(corre))
	llc='lc' + ALLTRIM(STR(corre))
	SELECT ctemphoz
	LOCATE FOR ctemphoz.id_eess=eess AND ctemphoz.idcita=cita
		REPLACE &ldx WITH dx, &ltd WITH td, &llc WITH lc
ENDSCAN

SELECT e.red, e.microred, e.eess, e.renipress, h.numdoc, h.fecha, h.lote, h.pag, h.reg, h.cond_eess, h.cond_serv, ;
h.peso, h.talla, h.pc, h.pab, h.hb, h.pregesta, c.* ;
FROM ctemphoz c INNER JOIN HIS3 h ON h.idcita=c.idcita LEFT JOIN eesshis e ON e.id_eess=c.id_eess ;
WHERE h.correla=1 ORDER BY e.red, e.microred, e.renipress, h.fecha, h.numdoc

USE IN SELECT("ctempdx")
USE IN SELECT("ctemphoz")


*!*	CREATE CURSOR ctemphoz (id_eess INT, idcita VARCHAR(15), ;
*!*	DX1 C(10), TD1 C(1), LC1 C(5), ;
*!*	DX2 C(10), TD2 C(1), LC2 C(5), ;
*!*	DX3 C(10), TD3 C(1), LC3 C(5), ;
*!*	DX4 C(10), TD4 C(1), LC4 C(5), ;
*!*	DX5 C(10), TD5 C(1), LC5 C(5), ;
*!*	DX6 C(10), TD6 C(1), LC6 C(5), ;
*!*	DX7 C(10), TD7 C(1), LC7 C(5), ;
*!*	DX8 C(10), TD8 C(1), LC8 C(5), ;
*!*	DX9 C(10), TD9 C(1), LC9 C(5), ;
*!*	DX10 C(10), TD10 C(1), LC10 C(5), ;
*!*	DX11 C(10), TD11 C(1), LC11 C(5), ;
*!*	DX12 C(10), TD12 C(1), LC12 C(5), ;
*!*	DX13 C(10), TD13 C(1), LC13 C(5), ;
*!*	DX14 C(10), TD14 C(1), LC14 C(5), ;
*!*	DX15 C(10), TD15 C(1), LC15 C(5), ;
*!*	DX16 C(10), TD16 C(1), LC16 C(5), ;
*!*	DX17 C(10), TD17 C(1), LC17 C(5), ;
*!*	DX18 C(10), TD18 C(1), LC18 C(5), ;
*!*	DX19 C(10), TD19 C(1), LC19 C(5), ;
*!*	DX20 C(10), TD20 C(1), LC20 C(5), ;
*!*	DX21 C(10), TD21 C(1), LC21 C(5), ;
*!*	DX22 C(10), TD22 C(1), LC22 C(5), ;
*!*	DX23 C(10), TD23 C(1), LC23 C(5), ;
*!*	DX24 C(10), TD24 C(1), LC24 C(5), ;
*!*	DX25 C(10), TD25 C(1), LC25 C(5), ;
*!*	DX26 C(10), TD26 C(1), LC26 C(5), ;
*!*	DX27 C(10), TD27 C(1), LC27 C(5), ;
*!*	DX28 C(10), TD28 C(1), LC28 C(5), ;
*!*	DX29 C(10), TD29 C(1), LC29 C(5), ;
*!*	DX30 C(10), TD30 C(1), LC30 C(5), ;
*!*	DX31 C(10), TD31 C(1), LC31 C(5), ;
*!*	DX32 C(10), TD32 C(1), LC32 C(5), ;
*!*	DX33 C(10), TD33 C(1), LC33 C(5), ;
*!*	DX34 C(10), TD34 C(1), LC34 C(5), ;
*!*	DX35 C(10), TD35 C(1), LC35 C(5) )
