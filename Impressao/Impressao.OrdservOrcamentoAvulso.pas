unit Impressao.OrdservOrcamentoAvulso;

interface

uses sysutils, Variants,
  Wordxp,
  sqlexpr,
  DBClient, cxDBEdit,
  uconstantes, rotina.registro, rotina.datahora,
  orm.empresa, orm.equipamento, orm.usuario;

procedure OrcamentoAvulso(nmcliente: string; cdequipamento: integer; memdssolucao : TcxDBMemo; cds, cdsdetail, cdsitdefapr:TClientdataset);

implementation

procedure OrcamentoAvulso(nmcliente: string; cdequipamento: integer; memdssolucao : TcxDBMemo; cds, cdsdetail, cdsitdefapr:TClientdataset);
var
  Template, NewTemplate, ItemIndex :OleVariant;
  dtatendimento, lcatendimento, hratendimento, nmcontato, rzsocial, nuordserv, dsdefeito : string;
  WordApplication1: TWordApplication;
  equipamento : tequipamento;
begin
  WordApplication1 := TWordApplication.Create(nil);
  equipamento     := tequipamento.create;
  try
    equipamento.Select(cdequipamento);
    nuordserv     := cds.fieldbyname(_nuordserv).Asstring;
    rzsocial      := nmcliente;
    nmcontato     := '';
    dtatendimento := formatdatetime(_dd_mm_yyyy, cds.fieldbyname(_dtentrada).AsDateTime);
    lcatendimento := '';
    hratendimento := formatdatetime(_hh_mm_ss, cds.fieldbyname(_hrentrada).AsDateTime);
    cdsitdefapr.First;
    while not cdsitdefapr.Eof do
    begin
      if cdsitdefapr.RecNo > 1 then
      begin
        dsdefeito := dsdefeito + ', ';
      end;
      dsdefeito := dsdefeito + cdsitdefapr.fieldbyname(_nmdefeito).AsString;
      cdsitdefapr.Next;
    end;

    WordApplication1.Connect;
    WordApplication1.Visible := true;
    Template    := EmptyParam;
    NewTemplate := true;

    WordApplication1.Documents.AddOld(template, newtemplate);
    ItemIndex   := 1;
    with WordApplication1.Documents.Item(ItemIndex).Paragraphs.Last.Range do
    begin
      InsertAfter('Or�amento de Servi�o'#13#13);
      InsertAfter(Empresa.endereco.nmmunicipio+', '+formatdatetime(_dd, dtbanco)+' de '+formatdatetime(_mmmm, dtbanco)+' de '+formatdatetime(_yyyy, dtbanco)+#13#13);
      InsertAfter('�: '+rzsocial+#13);
      InsertAfter('A/C: '+nmcontato+#13#13);
      InsertAfter('Ordem de Servi�o: '+nuordserv+#13);
      InsertAfter('Marca: '+qregistro.NomedoCodigo(_marca, equipamento.cdmarca)+#13);
      InsertAfter('Modelo: '+qregistro.NomedoCodigo(_modelo, equipamento.cdmodelo)+#13);
      if equipamento.cdcor > 0 then
      begin
        InsertAfter('Cor: '+qregistro.NomedoCodigo(_cor, equipamento.cdcor)+#13);
      end;
      if equipamento.nuserie      <> '' then
      begin
        InsertAfter('N� Serie: '     +equipamento.nuserie     +#13#13);
      end;
      if equipamento.nupatrimonio <> '' then
      begin
        InsertAfter('N� Patrim�nio: '+equipamento.nupatrimonio+#13#13);
      end;
      InsertAfter('Or�amento: '#13#13);
      InsertAfter(memdssolucao.Text+#13#13);
      InsertAfter('Solu��o:'#13#13);
      cdsDetail.First;
      while not cdsDetail.Eof do
      begin
        InsertAfter(cdsdetail.fieldbyname(_qtitem).Asstring+'  '+cdsdetail.fieldbyname(_nmproduto).Asstring+'.......... R$ '+cdsdetail.fieldbyname(_vltotal).AsString+#13);
        cdsdetail.Next;
      end;
      InsertAfter(''#13);
      InsertAfter('Valor do servi�o a executar.................................R$ '+cds.fieldbyname(_vltotal).Asstring+#13#13);
      insertafter('Or�amento � v�lido por 05 dias.'#13);
      insertafter(stringofchar('.', 120)+#13);
      insertafter('Garantia de 03 (tr�s) meses.'#13);
      insertafter('Para autoriza��o, favor reenviar este devidamente assinado para o tel. '+Empresa.nufone1+'.'#13#13);
      insertafter('Atenciosamente,'#13#13);
      insertafter(usuario.nmusuario+#13);
      insertafter(Empresa.rzsocial+#13#13);
      insertafter('Acusa recebimento de:'#13#13#13);
      insertafter(stringofchar('_', 50)+#13);
      insertafter(rzsocial);
    end;
    WordApplication1.Disconnect;
  finally
    freeandnil(WordApplication1);
    freeandnil(equipamento);
  end;
end;

end.
