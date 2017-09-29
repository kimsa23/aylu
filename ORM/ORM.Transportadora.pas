unit ORM.Transportadora;

interface

uses
  Forms, controls, ExtCtrls, dialogs, SysUtils, Classes, Contnrs, db,
  pcteConversaoCTe, pcnConversao, system.UITypes,
  dialogo.progressbar, uconstantes, rotina.registro, rotina.strings,
  classe.aplicacao, classe.copiarregistro, classe.query, classe.executasql,
  orm.empresa, orm.uf, orm.veiculo, orm.ITTransportadoraEmail,
  rotina.retornasql, classe.Endereco, orm.Municipio, orm.StTransportadora,
  classe.dao, orm.fornecedor;

type
  TTransportadora = class(TRegistroQuipos)
  private
    Fbonenviarpdf: String;
    Fnudependentes: Integer;
    Fcdtpcnh: Integer;
    Fcdveiculocarreta: Integer;
    Fcdtransportadora: largeint;
    Fcdveiculocarreta2: integer;
    Fcdsttransportadora: Integer;
    Fcdveiculo: Integer;
    Fcdmunicipio: Integer;
    Fcdoutrotransportadora: Integer;
    Fcdpais: integer;
    Fcduf: integer;
    Fdscomplemento: string;
    Femail: string;
    Fdsendereco: string;
    Fnufone2: string;
    Fnufone3: string;
    Ftppessoa: string;
    Fnmtransportadora: string;
    Fnucnpj: string;
    Frzsocial: string;
    Fnufone1: string;
    Fnucxpostal: string;
    Fcdsexo: string;
    Fnmmotorista: string;
    Fdsnumero: string;
    Fnuinscest: string;
    Fdsobservacao: string;
    Fnucep: string;
    Fnmmae: string;
    Fnurntrc: string;
    Fnucnh: string;
    Fnufax: string;
    Fnuinss: string;
    Fhomepage: string;
    Fnmbairro: string;
    Fnmconjuge: string;
    Fcdestcivil: string;
    Fnuidentid: string;
    Fnmpai: string;
    Fnmcontato: string;
    Fnucpf: string;
    Fdtvencimentocnh: TDate;
    Fdtcadastro: TDate;
    Fdtnascimento: TDate;
    ftpregime: string;
    fnucntcontabil: string;
  public
    [keyfield]
    property cdtransportadora : largeint read Fcdtransportadora write Fcdtransportadora;
    [fk]
    property cduf : integer read Fcduf write Fcduf;
    [fk]
    property cdsttransportadora : Integer read Fcdsttransportadora write fcdsttransportadora;
    [fk]
    property cdmunicipio : Integer read Fcdmunicipio write fcdmunicipio;
    [fk]
    property cdveiculo : Integer read Fcdveiculo write fcdveiculo;
    [fk]
    property cdveiculocarreta : Integer read Fcdveiculocarreta write fcdveiculocarreta;
    [fk]
    property cdveiculocarreta2 : integer read Fcdveiculocarreta2 write fcdveiculocarreta2;
    property nmtransportadora : string read Fnmtransportadora write fnmtransportadora;
    property rzsocial : string read Frzsocial write frzsocial;
    property dsendereco : string read Fdsendereco write fdsendereco;
    property nmbairro : string read Fnmbairro write fnmbairro;
    property nucxpostal : string read Fnucxpostal write fnucxpostal;
    property nucep : string read Fnucep write fnucep;
    property nufone1 : string read Fnufone1 write fnufone1;
    property nufone2 : string read Fnufone2 write fnufone2;
    property nufone3 : string read Fnufone3 write fnufone3;
    property nufax : string read Fnufax write fnufax;
    property tppessoa : string read Ftppessoa write ftppessoa;
    property nuinscest : string read Fnuinscest write fnuinscest;
    property nucnpj : string read Fnucnpj write fnucnpj;
    property nmmotorista : string read Fnmmotorista write fnmmotorista;
    property nucpf : string read Fnucpf write fnucpf;
    property nuidentid : string read Fnuidentid write fnuidentid;
    property nmmae : string read Fnmmae write fnmmae;
    property nmpai : string read Fnmpai write fnmpai;
    property nmconjuge : string read Fnmconjuge write fnmconjuge;
    property cdsexo : string read Fcdsexo write fcdsexo;
    property cdestcivil : string read Fcdestcivil write fcdestcivil;
    property dtnascimento : TDate read Fdtnascimento write fdtnascimento;
    property email : string read Femail write femail;
    property homepage : string read Fhomepage write fhomepage;
    property nuinss : string read Fnuinss write fnuinss;
    property nudependentes : Integer read Fnudependentes write fnudependentes;
    property cdoutrotransportadora : Integer read Fcdoutrotransportadora write fcdoutrotransportadora;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property dsnumero : string read Fdsnumero write fdsnumero;
    property dscomplemento : string read Fdscomplemento write fdscomplemento;
    property nucnh : string read Fnucnh write fnucnh;
    property nurntrc : string read Fnurntrc write fnurntrc;
    property cdpais : integer read Fcdpais write fcdpais;
    property bonenviarpdf : string read Fbonenviarpdf write fbonenviarpdf;
    property nmcontato : string read Fnmcontato write fnmcontato;
    property dtcadastro : TDate read Fdtcadastro write fdtcadastro;
    property cdtpcnh : Integer read Fcdtpcnh write fcdtpcnh;
    property dtvencimentocnh : TDate read Fdtvencimentocnh write fdtvencimentocnh;
    property tpregime: string read ftpregime write ftpregime;
    property nucntcontabil : string read fnucntcontabil write fnucntcontabil;
    function GetCodigoCNPJCPF:String;
    function GerarCodigoReduzido: string;
    function GerarCodigoCNPJCPF:string;
    function getTppessoaProprietarioVeiculo(codigo: string):string;
    function hintRzsocial : string;
    function GerarFornecedor:LargeInt;
    function codigo_transportadora_como_fornecedor:string;
    class function Listaemail(codigo:Largeint):string;
    class procedure AplicarCodigoContabildaEmpresa;
    class function ObterCdTransportadoraPelaPlaca(nuplaca:string):Largeint;
    class function PossuiVeiculoeProprietario(value:Largeint):Boolean;
  end;

implementation

function TTransportadora.GerarCodigoReduzido: string;
var
  q : TClasseQuery;
  newcod : integer;
  reg_alterado : Integer;
  procedure atualizar_tabela(tabela:string; dsadicional: string='');
  begin
    ExecutaSQL('update '+tabela+' set cdtransportadora'+dsadicional+'='+newcod.ToString+' where cdempresa='+empresa.cdempresa.ToString+' and cdtransportadora'+dsadicional+'='+q.q.fieldbyname(_cdtransportadora).AsString);
  end;
begin
  q              := TClasseQuery.Create;
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    q.q.Open('SELECT CDTRANSPORTADORA,NUCNPJ,NUCPF FROM TRANSPORTADORA where cdempresa='+empresa.cdempresa.ToString);
    frmprogressbar.gau.MaxValue := 100;
    frmprogressbar.Show;
    reg_alterado := 0;
    while not q.q.Eof do
    begin
      if frmprogressbar.gau.Progress = 100 then
      begin
        frmprogressbar.gau.Progress := 0;
      end;
      Application.Title           := q.q.fieldbyname(_cdtransportadora).AsString;
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      if ((removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucnpj).AsString, _0)) <> q.q.FieldByName(_cdtransportadora).AsString) and
         (removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucpf).AsString, _0)) <> q.q.FieldByName(_cdtransportadora).AsString) and
         (Length(q.q.fieldbyname(_cdtransportadora).AsString) <7)) or (q.q.fieldbyname(_cdtransportadora).AsString = '')then
      begin
        q.q.Next;
        continue;
      end;
      inc(reg_alterado);
      // copiar dados do transportadora
      newcod := copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _transportadora            , _cdtransportadora,     0, '', '');
      // copiar dados dos itens
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _itbancot               , _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _itconttransportadora   , _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _ittransportadoraarquivo, _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _ittransportadoraemail  , _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _transportadoramunicipio, _cdtransportadora, newcod, '', '');
      // alterar dados nas tabelas relacionadas
      atualizar_tabela(_ctetransportadora);
      atualizar_tabela(_entrada);
      atualizar_tabela(_orcamento);
      atualizar_tabela(_pedido);
      atualizar_tabela(_rpa);
      atualizar_tabela(_saida);
      atualizar_tabela(_transporte);
      atualizar_tabela(_veiculo);

      ExecutaSQL('delete from transportadora where cdempresa='+empresa.cdempresa.ToString+' and cdtransportadora='+q.q.fieldbyname(_cdtransportadora).AsString);
      q.q.Next;
    end;
    ShowMessage('Foram alterados '+inttostr(reg_alterado)+' registro(s).');
  finally
    freeandnil(q);
    freeandnil(frmprogressbar);
  end;
end;

function TTransportadora.GerarFornecedor: LargeInt;
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.create;
  try
    result := GetCodigoCNPJCPF.ToInt64;
    if result = 0 then
    begin
      MessageDlg('CNPJ ou CPF está vazio no cadastro da Transportadora.', mtInformation, [mbOK], 0);
      abort;
    end;
    if qregistro.codigoexiste(_fornecedor, result) then
    begin
      exit;
    end;
    fornecedor.cdfornecedor := result;
    fornecedor.cduf := cduf;
    fornecedor.cdmunicipio := cdmunicipio;
    fornecedor.nmfornecedor := nmtransportadora;
    fornecedor.rzsocial := rzsocial;
    fornecedor.dsendereco := dsendereco;
    fornecedor.nmbairro := nmbairro;
    fornecedor.nucep := nucep;
    fornecedor.nucxpostal := nucxpostal;
    fornecedor.nufone1 := nufone1;
    fornecedor.nufone2 := nufone2;
    fornecedor.nufone3 := nufone3;
    fornecedor.nufax := nufax;
    fornecedor.tppessoa := tppessoa;
    fornecedor.nuinscest := nuinscest;
    fornecedor.nucnpj := nucnpj;
    fornecedor.nucpf := nucpf;
    fornecedor.nuidentid := nuidentid;
    fornecedor.dtnascimento := dtnascimento;
    fornecedor.cdsexo := cdsexo;
    fornecedor.cdestcivil := cdestcivil;
    fornecedor.nmmae := nmmae;
    fornecedor.nmpai := nmpai;
    fornecedor.nmconjuge := nmconjuge;
    fornecedor.email := email;
    fornecedor.homepage := homepage;
    fornecedor.dsobservacao := dsobservacao;
    fornecedor.dsnumero := dsnumero;
    fornecedor.dscomplemento := dscomplemento;
    fornecedor.bonenviarpdf := bonenviarpdf;
    fornecedor.cdpais := cdpais;
    fornecedor.tpregime := tpregime;
    fornecedor.nucntcontabil := nucntcontabil;
    fornecedor.Insert;
  finally
    freeandnil(fornecedor);
  end;
end;

function TTransportadora.GetCodigoCNPJCPF: string;
begin
  if tppessoa = _J then
  begin
    result := removercaracteres(nucnpj);
  end;
  if tppessoa = _f then
  begin
    result := removercaracteres(nucpf);
  end;
end;

function TTransportadora.getTppessoaProprietarioVeiculo(codigo: string):string;
  function makesql:string;
  begin
    result := 'select p.tppessoa '+
              'from transportadora t '+
              'inner join veiculo v on v.cdempresa=t.cdempresa and v.cdveiculo=t.cdveiculo '+
              'inner join transportadora p on p.cdempresa=v.cdempresa and p.cdtransportadora=v.cdtransportadora '+
              'where t.cdempresa='+empresa.cdempresa.ToString+' and t.cdtransportadora='+codigo;
  end;
begin
  result := RetornaSQLString(makesql);
end;

class procedure TTransportadora.AplicarCodigoContabildaEmpresa;
begin
  if aplicacao.confire.ExecSQL('update transportadora set nucntcontabil='+empresa.transportadora.nucntcontabil+' where cdempresa='+empresa.cdempresa.tostring) = 0 then
  begin
    showmessage('Aplicado código contábil.');
  end;
end;

function TTransportadora.codigo_transportadora_como_fornecedor: string;
begin
  Result := GetCodigoCNPJCPF;
  if result = '' then
  begin
    result := GerarFornecedor.tostring;
  end;
end;

function TTransportadora.GerarCodigoCNPJCPF: string;
var
  q : TClasseQuery;
  newcod : integer;
  reg_alterado : Integer;
  procedure atualizar_tabela(tabela:string; dsadicional: string=''; nome:string='cdtransportadora');
  begin
    ExecutaSQL('update '+tabela+' set '+nome+dsadicional+'='+newcod.ToString+' where '+nome+dsadicional+'='+q.q.fieldbyname(_cdtransportadora).AsString);
  end;
  function codigo_for_cpf_cnpj:Boolean;
  begin
    result := (removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucnpj).AsString, _0)) = q.q.FieldByName(_cdtransportadora).AsString) or
              (removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucpf).AsString, _0)) = q.q.FieldByName(_cdtransportadora).AsString);
  end;
  function cnpj_cpf_preenchido:boolean;
  begin
    result := (removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucnpj).AsString, _0)) <> '') or
              (removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucpf).AsString , _0)) <> '');
  end;
  function codigo_cpf_cnpj:integer;
  var
    texto : string;
  begin
    texto := removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucnpj).AsString, _0));
    if texto = '' then
    begin
      texto := removercaracteres(RemoverCaracterInicio(q.q.FieldByName(_nucpf).AsString , _0));
    end;
    result := strtoint(texto);
  end;
begin
  q := TClasseQuery.Create;
  frmprogressbar := Tfrmprogressbar.Create(nil);
  try
    q.q.Open('SELECT CDTRANSPORTADORA,NUCNPJ,NUCPF FROM TRANSPORTADORA where cdempresa='+empresa.cdempresa.ToString);
    frmprogressbar.gau.MaxValue := 100;
    frmprogressbar.Show;
    reg_alterado := 0;
    while not q.q.Eof do
    begin
      if frmprogressbar.gau.Progress = 100 then
      begin
        frmprogressbar.gau.Progress := 0;
      end;
      Application.Title           := q.q.fieldbyname(_cdtransportadora).AsString;
      frmprogressbar.gau.Progress := frmprogressbar.gau.Progress + 1;
      Application.ProcessMessages;
      if Codigo_for_CPF_CNPJ or (not cnpj_cpf_preenchido) then
      begin
        q.q.Next;
        continue;
      end;
      newcod := codigo_cpf_cnpj;
      if qregistro.CodigoExiste(_transportadora, newcod) then
      begin
        q.q.Next;
        continue;
      end;
      inc(reg_alterado);
      // copiar dados
      newcod := copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _transportadora   , _cdtransportadora, newcod, '', '');
      // copiar dados dos itens
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _itbancot               , _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _itconttransportadora   , _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _ittransportadoraarquivo, _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _ittransportadoraemail  , _cdtransportadora, newcod, '', '');
      copiar_registro(q.q.fieldbyname(_cdtransportadora).AsLargeInt, _transportadoramunicipio, _cdtransportadora, newcod, '', '');
      // alterar dados nas tabelas relacionadas
      atualizar_tabela(_ctetransportadora);
      atualizar_tabela(_entrada);
      atualizar_tabela(_orcamento);
      atualizar_tabela(_pedido);
      atualizar_tabela(_rpa);
      atualizar_tabela(_saida);
      atualizar_tabela(_transporte);
      atualizar_tabela(_veiculo);
      // excluir
      ExecutaSQL('delete from transportadora where cdempresa='+empresa.cdempresa.ToString+' and cdtransportadora='+q.q.fieldbyname(_cdtransportadora).AsString);
      q.q.Next;
    end;
    ShowMessage('Foram alterados '+inttostr(reg_alterado)+' registro(s).');
  finally
    FreeAndNil(q);
    FreeAndNil(frmprogressbar);
  end;
end;

function TTransportadora.hintRzsocial: string;
begin
  if tppessoa = _J then
  begin
    result := 'CNPJ: '+nucnpj+' Inscrição Estadual: '+nuinscest
  end
  else
  begin
    result := 'CPF: '+nucpf;
  end;
  result := result + #13'Endereço: '+dsendereco;
  if dsnumero <> '' then
  begin
    result := result+', '+dsnumero;
  end;
  if dscomplemento <> '' then
  begin
    result := result+', '+dscomplemento;
  end;
  result := result + ' Fone: '+nufone1+
                 #13'Bairro: '+nmbairro+
                   ' Cidade: '+qregistro.NomedoCodigo(_municipio, cdmunicipio)+
                       ' UF: '+qregistro.StringdoCodigo(_uf, cduf, _sguf)+
                      ' CEP: '+NUCEP;
end;

class function TTransportadora.Listaemail(codigo: Largeint): string;
var
  lista : TittransportadoraemailList;
begin
  lista := TittransportadoraemailList.Create;
  try
    lista.Ler(codigo);
    result := lista.Listaemail;
  finally
    freeandnil(lista);
  end;
end;

class function TTransportadora.ObterCdTransportadoraPelaPlaca(nuplaca:string): Largeint;
var
  veiculo : TVeiculo;
  transportadora : TTransportadora;
begin
  result := 0;
  veiculo := TVeiculo.Create;
  transportadora := TTransportadora.Create;
  try
    if not veiculo.Select(_nuplaca+'='+nuplaca.QuotedString) then
    begin
      Exit;
    end;
    if transportadora.Select(_cdveiculo+'='+veiculo.cdveiculo.ToString) then
    begin
      result := transportadora.cdtransportadora;
    end;
  finally
    FreeAndNil(veiculo);
    FreeAndNil(transportadora);
  end;
end;

class function TTransportadora.PossuiVeiculoeProprietario(value: Largeint): Boolean;
var
  cdproprietario, cdveiculo : Integer;
begin
  cdveiculo := QRegistro.InteirodoCodigo(_transportadora, value, _cdveiculo);
  if cdveiculo = 0 then
  begin
    MessageDlg('Não está definido o veículo no cadastro do motorista.', mtInformation, [mbOK], 0);
    Abort;
  end;
  cdproprietario := QRegistro.InteirodoCodigo(_veiculo, cdveiculo, _cdtransportadora);
  if cdproprietario = 0 then
  begin
    MessageDlg('Não está definido o proprietário no cadastro do veículo do motorista.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

end.
