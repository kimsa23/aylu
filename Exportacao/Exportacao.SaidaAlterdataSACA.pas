unit Exportacao.SaidaAlterdataSACA;

interface

uses
  forms, controls, classes, sysutils, dialogs, ComCtrls, ExtCtrls, gauges,
  uconstantes, rotina.strings,
  orm.empresa, classe.aplicacao, classe.Query;

function Exportar_Serie_D_Alterdata(dti, dtf: TDate):boolean;

implementation

type
  TExportar = class(tobject)
  private
  protected
    dti, dtf : TDate;
    linha : tstrings;
    c, cit : TClasseQuery;
    savedialog : TSaveDialog;
    function makesql:string;
    function makesqlit:string;
    procedure Abrir_saida;
    procedure Abrir_itsaida;
    procedure Registro01;
    procedure Registro02;
    procedure Registro03;
    procedure registro04;
    procedure selecionar_registro_filho;
  public
    constructor create;
    function    gerar(datai, dataf:TDate):boolean;
    destructor  destroy; override;
  end;


function Exportar_Serie_D_Alterdata(dti, dtf: TDate):boolean;
var
  exportar : TExportar;
begin
  exportar := TExportar.create;
  try
    result := exportar.gerar(dti, dtf);
  finally
    exportar.Free;
  end;
end;

procedure TExportar.Abrir_itsaida;
begin
  cit.q.Connection := aplicacao.confire;
  cit.q.sql.text   := makesqlit;
  cit.q.Open;
end;

procedure TExportar.Abrir_saida;
begin
  c.q.Connection := aplicacao.confire;
  c.q.sql.text      := makesql;
  c.q.Open;
end;

constructor TExportar.create;
begin
  c   := TClasseQuery.Create;
  cit := TClasseQuery.Create;
  linha      := tstringlist.Create;
  savedialog := tsavedialog.Create(nil);
end;

destructor TExportar.destroy;
begin
  freeandnil(c);
  freeandnil(cit);
  freeandnil(linha);
  freeandnil(savedialog);
  inherited;
end;

function TExportar.gerar(datai, dataf: TDate): boolean;
begin
  dti := datai;
  dtf := dataf;
  Abrir_saida;
  Abrir_itsaida;
  while not c.q.Eof do
  begin
    Registro01;
    Registro02;
    Registro03;
    selecionar_registro_filho;
    while not cit.q.Eof do
    begin
      registro04;
      cit.q.Next;
    end;
    c.q.Next;
  end;
  savedialog.FileName := 'Serie D '+empresa.nmempresa+' '+FormatDateTime(_yyyymm, dti)+'.'+_txt;
  Result              := savedialog.Execute;
  if result then
  begin
    linha.SaveToFile(savedialog.FileName);
  end;
end;

function TExportar.makesql: string;
begin
  result := 'select s.cdsaida'+
                  ',e.nuserie'+
                  ',s.nusaida'+
                  ',s.dtemissao'+
                  ',s.dtsaida'+
                  ',c.q.cdcliente'+
                  ',c.q.nmcliente'+
                  ',c.q.dsendereco'+
                  ',c.q.nmbairro'+
                  ',m.nmmunicipio'+
                  ',c.q.nucep'+
                  ',u.sguf'+
                  ',c.q.nufone1'+
                  ',c.q.nucnpj'+
                  ',c.q.nuinscest'+
                  ',s.tpentsai'+
                  ',s.cdcfop'+
                  ',c.q.cdmunicipio'+
                  ',s.vltotal'+
                  ',s.vlicms'+
                  ',s.vlbaseicms'+
                  ',(select first 1 alicms from itsaida where cdempresa=s.cdempresa and cdsaida=s.cdsaida) alicms'+
                  ',s.nudocfiscalicms '+
            'from saida s '+
            'inner join serie e on e.cdserie=s.cdserie and s.cdempresa=e.cdempresa '+
            'left join cliente c on c.q.cdcliente=s.cdcliente and s.cdempresa=c.q.cdempresa '+
            'left join municipio m on m.cdmunicipio=c.q.cdmunicipio '+
            'left join uf u on u.cduf=c.q.cduf '+
            'where s.nudocfiscalicms=''02'' and s.cdempresa='+empresa.cdempresa.tostring+' and s.dtemissao between '+GetDtBanco(dti)+' and '+GetDtBanco(dtf)
end;

function TExportar.makesqlit: string;
begin
  result := 'select i.cdproduto'+
                  ',p.nmproduto'+
                  ',p.nuclfiscal'+
                  ',u.nmunidade'+
                  ',i.cdsaida'+
                  ',i.qtitem'+
                  ',i.vltotal'+
                  ',i.nusticms'+
                  ',i.vlunitario'+
                  ',i.vlipi'+
                  ',i.vlbaseicms'+
                  ',i.vldesconto '+
            ' from saida s '+
            'inner join itsaida i on i.cdsaida=s.cdsaida and s.cdempresa=i.cdempresa '+
            'inner join produto p on p.cdproduto=i.cdproduto and p.cdempresa=i.cdempresa '+
            'left join unidade u on u.cdunidade=p.cdunidade and u.cdempresa=p.cdempresa '+
            'where s.nudocfiscalicms=''02'' and s.cdempresa='+empresa.cdempresa.tostring+' and s.dtemissao between '+GetDtBanco(dti)+' and '+GetDtBanco(dtf)
end;

procedure TExportar.Registro01;
begin
  linha.Add(
                                                                                //NOME DO CAMPO	                                  DE	AT�	TAMANHO	TIPO
  FormatarTextoEsquerda(empresa.livro.cdalterdata, 5, _0)+                                             //C�digo da Empresa	                              1	  5	  5	      Num�rico
  FormatarTextoDireita('NF', 5)+                                               //Esp�cie NF	                                    6	  10	5	      Alfanum�rico
  FormatarTextoDireita(c.q.fieldbyname(_nuserie).AsString, 5)+                    //Serie NF	                                      11	15	5	      Alfanum�rico
  FormatarTextoDireita(c.q.fieldbyname(_nusaida).AsString, 13)+                   //Numero NF	                                      16	28	13	    Alfanum�rico
  stringofchar(_0, 3)+                                                          //C�digo Fiscal (**)	                            29	31	3	      Num�rico
  FormatDateTime(_DDMMAA, c.q.fieldbyname(_dtemissao).AsDateTime)+                //Data de Emiss�o (DDMMAA)	                      32	37	6	      Num�rico
  FormatDateTime(_DDMMAA, c.q.fieldbyname(_dtsaida).AsDateTime)+                  //Data de Entrada/Sa�da (DDMMAA)	                38	43	6	      Num�rico
  stringofchar('*', 5)+                                                         //C�digo Cont�bil UM (valor cont�bil)	            44	48	5	      Alfanum�rico
  stringofchar('*', 5)+                                                         //C�digo Cont�bil DOIS (valor ICMS)	              49	53	5	      Alfanum�rico
  stringofchar('*', 5)+                                                         //C�digo Cont�bil TR�S (valor IPI)	              54	58	5	      Alfanum�rico
  FormatarTextoEsquerda(c.q.fieldbyname(_cdcliente).AsString, 16, _0)+            //C�digo ou CNPJ do Fornecedor ou Cliente	        59	74	16	    Num�rico
  FormatarTextoDireita(RetiraAcentos(c.q.fieldbyname(_nmcliente).AsString), 40)+  //Nome	                                          75	114	40	    Alfanum�rico
  FormatarTextoDireita(RetiraAcentos(c.q.fieldbyname(_dsendereco).AsString), 40)+ //Endere�o	                                      115	154	40	    Alfanum�rico
  FormatarTextoDireita(RetiraAcentos(c.q.fieldbyname(_nmbairro).AsString), 15)+   //Bairro	                                        155	169	15	    Alfanum�rico
  FormatarTextoDireita(RetiraAcentos(c.q.fieldbyname(_nmmunicipio).AsString), 15)+//Cidade	                                        170	184	15	    Alfanum�rico
  FormatarTextoEsquerda(removercaracteres(c.q.fieldbyname(_nucep).AsString), 8, _0)+//CEP                                           185	192	8	      Num�rico
  FormatarTextoDireita(RetiraAcentos(c.q.fieldbyname(_sguf).AsString), 2)+        //UF	                                            193	194	2	      Alfab�tico
  FormatarTextoDireita(c.q.fieldbyname(_nufone1).AsString, 12)+                   //Telefone	                                      195	206	12	    Alfanum�rico
  FormatarTextoEsquerda(removercaracteres(c.q.fieldbyname(_nucnpj).AsString), 14, _0)+//CNPJ/CPF                                    207	220	14	    Num�rico
  FormatarTextoDireita(RetiraAcentos(c.q.fieldbyname(_nuinscest).AsString), 16)+  //Inscri��o Estadual	                            221	236	16	    Alfanum�rico
  espaco(5)+                                                                    //Conta (c�digo no plano de contas)	              237	241	5	      Alfanum�rico
  stringofchar(_0, 3)+                                                          //C�digo da Natureza das opera��es	              242	244	3	      Num�rico
  FormatarTextoEsquerda(c.q.fieldbyname(_tpentsai).AsString, 1)+                  //Tipo da Nota: Entrada ou Sa�da	                245	245	1	      E ou S
  FormatarTextoEsquerda(c.q.fieldbyname(_cdsaida).AsString, 6, _0)+               //Registro Seq�encial para cada NF	              246	251	6	      Num�rico
  espaco(1)+                                                                    //Cancelamento ou Exclus�o de notas	              252	252	1	      C ou E
  FormatarTextoEsquerda(c.q.fieldbyname(_cdcfop).AsString, 4)+                    //C�digo Fiscal (usar para cfop de 4 digitos)	    253	256	4	      Num�rico
  espaco(10)+                                                                   //Conta (c�digo no plano de contas)	              257	266	10	    Alfanum�rico
  espaco(5)+                                                                    //C�digo Cont�bil QUATRO (valor st)	              267	271	5	      Alfanum�rico
  espaco(16)+                                                                   //C�digo ou CNPJ do destinat�rio ou remente (*)	  272	287	16	    Alfanum�rico
  espaco(40)+                                                                   //Nome do destinat�rio ou remetente (*)	          288	327	40	    Alfanum�rico
  espaco(40)+                                                                   //Endere�o do destinat�rio ou remetente (*)	      328	367	40	    Alfanum�rico
  espaco(15)+                                                                   //Bairro do destinat�rio ou remetente (*)	        368	382	15	    Alfanum�rico
  espaco(15)+                                                                   //Cidade do destinat�rio ou remetente (*)	        383	397	15	    Alfanum�rico
  Stringofchar(_0, 8)+                                                          //CEP do destinat�rio ou remetente (*)	          398	405	8	      Num�rico
  espaco(2)+                                                                    //UF do destinat�rio ou remetente (*)	            406	407	2	      Alfab�tico
  espaco(12)+                                                                   //Telefone do destinat�rio ou remetente (*)	      408	419	12	    Alfanum�rico
  stringofchar(_0, 14)+                                                         //CNPJ/CPF do destinat�rio ou remetente (*)	      420	433	14	    Num�rico
  espaco(16)+                                                                   //Insc.q. Estadual do destinat�rio ou remetente (*)	434	449	16	    Alfanum�rico
  espaco(5)+                                                                    //Conta (c�d no plano contas) destin/remet (*)	  450	454	5	      Alfanum�rico
  stringofchar(_0, 5)+                                                          //C�digo do Pa�s	                                455	459	5	      Num�rico
  stringofchar(_0, 14)+                                                         //Inscri��o Suframa	                              460	473	14	    Numerico
  FormatarTextoEsquerda(c.q.fieldbyname(_cdmunicipio).AsString, 7, _0)+           //C�d do munic�pio IBGE	                          474	480	7	      Num�rico
  espaco(16)+                                                                   //C�digo ou CNPJ do remetente	                    481	496	16	    Alfanum�rico
  espaco(40)+                                                                   //Nome do remetente 	                            497	536	40	    Alfanum�rico
  espaco(40)+                                                                   //Endere�o do remetente 	                        537	576	40	    Alfanum�rico
  espaco(15)+                                                                   //Bairro do remetente 	                          577	591	15	    Alfanum�rico
  espaco(15)+                                                                   //Cidade do remetente 	                          592	606	15	    Alfanum�rico
  stringofchar(_0, 8)+                                                          //CEP do remetente 	                              607	614	8	      Num�rico
  espaco(2)+                                                                    //UF do remetente 	                              615	616	2	      Alfab�tico
  espaco(12)+                                                                   //Telefone do remetente 	                        617	628	12	    Alfanum�rico
  stringofchar(_0, 14)+                                                         //CNPJ/CPF do remetente 	                        629	642	14	    Num�rico
  espaco(16)+                                                                   //Insc.q. Estadual do remetente 	                  643	658	16	    Alfanum�rico
  espaco(5)+                                                                    //Conta (c�digo no plano de contas) do remetente 	659	663	5	      Alfanum�rico
  espaco(16)+                                                                   //C�digo ou CNPJ do consignat�rio	                664	679	16	    Alfanum�rico
  espaco(40)+                                                                   //Nome do consignat�rio	                          680	719	40	    Alfanum�rico
  espaco(40)+                                                                   //Endere�o do consignat�rio	                      720	759	40	    Alfanum�rico
  espaco(15)+                                                                   //Bairro do consignat�rio 	                      760	774	15	    Alfanum�rico
  espaco(15)+                                                                   //Cidade do consignat�rio 	                      775	789	15	    Alfanum�rico
  stringofchar(_0, 8)+                                                          //CEP do consignat�rio	                          790	797	8	      Num�rico
  espaco(2)+                                                                    //UF do consignat�rio 	                          798	799	2	      Alfab�tico
  espaco(12)+                                                                   //Telefone do consignat�rio	                      800	811	12	    Alfanum�rico
  stringofchar(_0, 14)+                                                         //CNPJ/CPF do consignat�rio	                      812	825	14	    Num�rico
  espaco(16)+                                                                   //Insc.q. Estadual do consignat�rio 	              826	841	16	    Alfanum�rico
  espaco(5)+                                                                    //Conta (c�d no plano contas) consignat�rio	      842	846	5	      Alfanum�rico
  espaco(44)+                                                                   //Chave de Acesso NFe	                            847	890	44	    Alfanum�rico
  espaco(1)+                                                                    //Emiss�o Pr�pria	                                891	891	1	      Alfanum�rico
  stringofchar(_0, 5)                                                           //C�digo Cont�bil CINCO (STI)	                    892	896	5	      Num�rico
  )
end;

procedure TExportar.Registro02;
begin
  linha.Add(stringofchar(' ', 250));
{
NOME DO CAMPO	    DE	AT?	TAMANHO	TIPO
Observa��o da NF	1	  250	250	    Alfanum�rico
}
end;

procedure TExportar.Registro03;
begin
  linha.add(
                                                                     //NOME DO CAMPO	                                  DE	AT?	TAMANHO	TIPO
  FormatarMoedaSPonto_(c.q.fieldbyname(_vltotal).AsCurrency, 12)+         //Valor Cont�bil	                                  1	  12	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12) +                                         //ICMS Isentas	                                    13	24	(12,2)	Num�rico
  FormatarMoedaSPonto_(c.q.fieldbyname(_vltotal).AsCurrency, 12)+         //ICMS Outras	                                    25	36	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12) +                                         //ICMS Base	                                      37	48	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 04) +                                          //ICMS Al�quota	                                  49	52	(4,2)	  Num�rico
  FormatarMoedaSPonto_(0, 12) +                                         //ICMS Valor	                                      53	64	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //ICMS Ajuste	                                    65	76	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //IPI Isentas	                                    77	88	(12,2)	Num�rico
  FormatarMoedaSPonto_(c.q.fieldbyname(_vltotal).AsCurrency, 12)+         //IPI Outras	                                      89	100	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //IPI Base	                                        101	112	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 04)+                                          //IPI Al�quota	                                    113	116	(4,2)	  Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //IPI Valor	                                      117	128	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //IPI Ajuste	                                      129	140	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor a abater da base de cal. PIS	              141	152	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor a abater da base de cal. COFINS	          153	164	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Base da Substitui��o tribut�ria	                165	176	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor da Substitui��o tribut�ria	                177	188	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor das Despesas Acess�rias	                  189	200	(12,2)	Num�rico
  espaco(1)+                                                         //C�digo CIF_FOB (1=CIF, 2=FOB)	                  201	201	1	      Num�rico
  FormatarTextoEsquerda(c.q.fieldbyname(_nudocfiscalicms).AsString, 2)+//C�digo de Modelo Fiscal	                        202	203	2	      Alfanum�rico
  espaco(1)+                                                         //Identifica nota de Combust�vel (S/N)	            204	204	1	      Alfab�tico
  espaco(5)+                                                         //C�digo Situa��o Tribut�ria Federal	              205	209	5	      Alfanum�rico
  espaco(1)+                                                         //Cesta B�sica (ES) (S/N)	                        210	210	1	      Alfanum�rico
  FormatarMoedaSPonto_(0, 13)+                                          //Base do Diferencial	                            211	223	(13,2)	Num�rico
  FormatarMoedaSPonto_(0, 06)+                                          //Al�quota do Diferencial	                        224	229	(06,2)	Num�rico
  FormatarMoedaSPonto_(0, 13)+                                          //Valor do Diferencial	                            230	242	(13,2)	Num�rico
  espaco(1)+                                                         //Ajuste ICMS	                                    243	243	1	      Alfanum�rico
  espaco(1)+                                                         //Ajuste IPI	                                      244	244	1	      Alfanum�rico
  espaco(3)+                                                         //C�digo ECF	                                      245	247	3	      Alfanum�rico
  stringofchar(_0, 6)+                                               //Contador Redu��o Z	                              248	253	6	      Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Total Inicial	                            254	265	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Total Final	                              266	277	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor de venda (NF entrada)	                    278	289	(12,2)	Num�rico
  espaco(1)+                                                         //Desonera��o Industria Naval (RJ) (S/N)	          290	290	1	      Alfanum�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Cancelamento	                              291	302	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Descontos	                                303	314	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor ISSQN	                                    315	326	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Abatimento da base do IR	                  327	338	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Abatimento da base do CSLL	                339	350	(12,2)	Num�rico
  espaco(1)+                                                         //Status ICMS Antecipado	                          351	351	1	      Alfanum�rico
  espaco(1)+                                                         //Status ICMS na Fonte	                            352	352	1	      Alfanum�rico
  espaco(1)+                                                         //Status ICMS Valor Recolhido	                    353	353	1	      Alfanum�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Base ICMS interest.(Sub.Trib Interna RJ e GO)	  354	365	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor ICMS interest.(Sub.Trib Interna RJ e GO)	  366	377	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //ICMS Normal (GO)	                                378	389	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor de venda Bruta	                            390	401	(12,2)	Num�rico
  stringofchar(_0, 6)+                                              //Contador de rein�cio	                            402	407	6	      Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor do Frete 	                                408	419	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor do Seguro	                                420	431	(12,2)	Num�rico
  stringofchar(_0, 4)+                                               //C�digo da Embarca��o (*)	                        432	435	4	      Num�rico
  espaco(40)+                                                        //Descri��o da Embarca��o	                        436	475	40	    Alfanum�rico
  espaco(6)+                                                         //Al�quota FECP-RJ	                                476	481	6	      Alfanum�rico
  espaco(16)+                                                        //C�digo Remetente	                                482	497	16	    Alfanum�rico
  espaco(16)+                                                        //C�digo Destinat�rio	                            498	513	16	    Alfanum�rico
  espaco(1)+                                                         //Tomador (R)emetente ou (D)estinat�rio ou (C)onsignat�rio	514	514	1	Alfanum�rico
  stringofchar(_0, 6)+                                               //Data Emiss�o da Nota Fiscal atrelada ao CT	      515	520	6	      Num�rico
  espaco(2)+                                                         //Modelo da Nota Fiscal atrelada ao CT	            521	522	2	      Alfanum�rico
  espaco(5)+                                                         //S�rie da Nota Fiscal atrelada ao CT	            523	527	5	      Alfanum�rico
  espaco(6)+                                                         //N�mero da Nota Fiscal atrelada ao CT	            528	533	6	      Alfanum�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Cont�bil da Nota Fiscal atrelada ao CT	    534	545	(12,2)	Num�rico
  espaco(1)+                                                         //C�digo da antecipa��o tribut�ria (1a5 ou vazio)	546	546	1	      Alfanum�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor da Parcela Reduzida (GO)	                  547	558	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor da Parcela N�o Tributada (GO)	            559	570	(12,2)	Num�rico
  stringofchar(_0, 4)+                                               //N�mero do caixa (DIEF CE)	                      571	574	4	      Num�rico
  stringofchar(_0, 2)+                                               //C�d. Opera��o Doc.q. Fiscal (DIEF CE)	            575	576	2	      Num�rico
  stringofchar(_0, 2)+                                               //C�d. Situa��o Doc.q. Fiscal (DIEF CE)	            577	578	2	      Num�rico
  stringofchar(_0, 2)+                                               //C�d. Condi��o Participante (DIEF CE)	            579	580	2	      Num�rico
  stringofchar(_0, 2)+                                               //C�d. Motivo Refer�ncia Doc.q. Fiscal (DIEF CE)	    581	582	2	      Num�rico
  stringofchar(_0, 2)+                                               //C�d. N�mero Seguran�a (DIEF CE)	                583	584	2	      Num�rico
  stringofchar(_0, 5)+                                               //C�d. Munic�pio (DIEF CE)	                        585	589	5	      Num�rico
  espaco(50)+                                                        //Descri��o Munic�pio (DIEF CE)	                  590	639	50	    Alfanum�rico
  espaco(2)+                                                         //UF Munic�pio (DIEF CE)	                          640	641	2	      Alfanum�rico
  espaco(3)+                                                         //Subs�rie da Nota (DIEF CE)	                      642	644	3	      Alfanum�rico
  espaco(10)+                                                        //N�mero Dispositivo Seguran�a (DIEF CE)	          645	654	10	    Alfanum�rico
  espaco(3)+                                                         //S�rie Formul�rio (DIEF CE)	                      655	657	3	      Alfanum�rico
  espaco(3)+                                                         //Subs�rie Formul�rio (DIEF CE)	                  658	660	3	      Alfanum�rico
  espaco(10)+                                                        //N�mero Inicial Formul�rio (DIEF CE)	            661	670	10	    Alfanum�rico
  espaco(10)+                                                        //N�mero Final Formul�rio (DIEF CE)	              671	680	10	    Alfanum�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Desconto Global (DIEF CE) 	                681	692	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor Antecipado (DIEF CE)	                      693	704	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //ICMS Antecipado (DIEF CE)	                      705	716	(12,2)	Num�rico
  stringofchar(_0, 10)+                                              //N�mero Inicial Formul�rio (PI)	                  717	726	10	    Num�rico
  stringofchar(_0, 10)+                                              //N�mero Final Formul�rio (PI)	                    727	736	10	    Num�rico
  FormatarMoedaSPonto_(0, 12)+                                          //Valor IPI n�o aproveitado	                      737	748	(12,2)	Num�rico
  espaco(20)+                                                        //N�mero AIDF	                                    749	768	20	    Alfanum�rico
  stringofchar(_0, 4)+                                               //Ano AIDF	                                        769	772	4	      Num�rico
  espaco(2)+                                                         //C�digo de Situa��o do Documento	                773	774	2	      Alfanum�rico
  espaco(1)+                                                         //Tipo de Pagamento	                              775	775	1	0 - � vista ou 1 - a prazo
  FormatarMoedaSPonto_(0, 12)+                                           //Valor de Cancelamento do ISSQN	                776	787	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                           //Valor de Cancelamento do ICMS	                  788	799	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                           //Valor de Desconto do ISSQN	                    800	811	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                           //Valor de Desconto do ICMS	                      812	823	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                           //Valor de Acr�scimo do ISSQN	                    824	835	(12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                           //Valor de Acr�scimo do ICMS	                    836	847	(12,2)	Num�rico
  espaco(3)+                                                          //C�digo do Tipo de Receita (Simples Nacional)	  848	850	3	      Alfanum�rico
  espaco(16)                                                          //C�digo Consignat�rio	                          851	866	16	    Alfanum�rico
  );
end;

procedure TExportar.registro04;
begin
  linha.add(
                                                                                //NOME DO CAMPO	                                DE	AT?	TAMANHO	TIPO
  FormatarTextoDireita(cit.q.fieldbyname(_nuclfiscal).AsString, 20)+              // C�digo de IPI (classifica��o fiscal - NBM/SH)	1	  20	   20	    Alfanum�rico
  FormatarTextoDireita(RetiraAcentos(cit.q.fieldbyname(_nmunidade).AsString), 3)+ // Unidade (KG,TN, M2,M3,etc.q.)	                  21	23	   03	    Alfanum�rico
  FormatarDecimal3sponto(cit.q.fieldbyname(_qtitem).AsCurrency, 10, _e, _0)+                // Quantidade (3 decimais)	                      24	33	  (10,3)	Num�rico
  FormatarMoedaSPonto_(cit.q.fieldbyname(_vltotal).AsCurrency, 12)+               // Valor Bruto (Quantidade x Valor Unit�rio) 	    34	45	  (12,2)	Num�rico
  FormatarMoedaSPonto_(cit.q.fieldbyname(_vlipi).AsCurrency, 10)+                    // Valor do IPI	                                  46	55	  (10,2)	Num�rico
  FormatarTextoEsquerda(cit.q.fieldbyname(_nusticms).AsString, 3, _0)+            // C�digo situa��o tribut�ria	                    56	58	  03	    Num�rico
  stringofchar(_0, 5)+                                                          // C�digo do Produto	                            59	63	  05	    Num�rico
  FormatarMoedaSPonto_(cit.q.fieldbyname(_vlbaseicms).AsCurrency, 12)+               // Base de C�lculo do ICMS Pr�prio	              64	75	  (12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Base de C�lculo do ICMS Subst. Tributaria/Base de ICMS Agrega��o (DIEF CE)	            76	87	  (12,2)	Num�rico
  espaco(03)+                                                                   // Vago	                                          88	90	  3	      Alfanum�rico
  FormatarMoedaSPonto_(cit.q.fieldbyname(_vldesconto).AsCurrency, 12)+               // Desconto	                                      91	102	  (12,2)	Num�rico
  FormatarTextoDireita(RetiraAcentos(cit.q.fieldbyname(_nmproduto).AsString), 35)+// Descri��o do produto	                          103	137	  35	    Alfanum�rico
  stringofchar(_0, 3)+                                                          // C�digo Prodepe/Funcresce(PE)	                  138	 140	3	      Num�rico
  espaco(14)+                                                                   // C�digo Espec�fico	                            141  154	14	    Alfanum�rico
  stringofchar(_0, 6)+                                                          // N�mero Ordem Doc.q. Fiscal (COO)	                155	160	  6	      Num�rico
  stringofchar(_0, 5)+                                                          // Capacidade Volum�trica	                        161	165	  5	      Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Valor ICMS Pr�prio (DIEF CE)	                  166	177	  (12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Valor ICMS Agrega��o (DIEF CE)	                178	189	  (12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Valor IPI Isentas (DIEF CE)	                  190	201	  (12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Valor IPI Outros (DIEF CE)	                    202	213	  (12,2)	Num�rico
  FormatarMoedaSPonto_(0, 10)+                                                     // Qtd na Unidade Padr�o (DIEF CE)	              214	223	  (10,3)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Valor Unit�rio na Unidade (DIEF CE)	          224	235	  (12,2)	Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Valor Unit�rio Bruto (DIEF CE)	                236	247	  (12,2)	Num�rico
  stringofchar(_0, 2)+                                                          // Tipo de ICMS Agrega��o (DIEF CE)	              248	249	  2	      Num�rico
  stringofchar(_0, 2)+                                                          // C�digo do Valor Fiscal de ICMS (DIEF CE)	      250	251	  2	      Num�rico
  stringofchar(_0, 2)+                                                          // C�digo do Valor Fiscal de IPI (DIEF CE)	      252	253	  2	      Num�rico
  FormatarMoedaSPonto_(0, 12)+                                                     // Base de IPI (DIEF CE)	                        254	265	  (12,2)	Num�rico
  espaco(15)+                                                                   // C�digo Cont�bil do Produto (DIEF CE)	          266	280	  15	    Alfanum�rico
  espaco(50)+                                                                   // Descri��o Cont�bil do Produto (DIEF CE)	      281	330	  50	    Alfanum�rico
  espaco(53)+                                                                   // Descri��o do produto	                          331	383	  53	    Alfanum�rico
  FormatarTextoEsquerda(cit.q.fieldbyname(_cdproduto).AsString , 09)+             // C�digo do Produto	                            384	392	  9	      Num�rico
  espaco(14)+
  FormatarMoedaSPonto_(cit.q.fieldbyname(_vlunitario).AsCurrency, 12)             // Valor unitario
  );
end;

procedure TExportar.selecionar_registro_filho;
begin
  cit.q.Filtered := false;
  cit.q.Filter   := UpperCase(_CDSAIDA)+'='+c.q.fieldbyname(_cdsaida).AsString;
  cit.q.Filtered := True;
end;

end.
