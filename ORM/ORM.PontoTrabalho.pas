unit ORM.PontoTrabalho;

interface

uses SysUtils, Controls, db, Contnrs, Dialogs, system.Classes, system.uitypes,
  rotina.retornasql, orm.empresa, classe.query, classe.dao,
  orm.Turno,
  rotina.strings, rotina.Registro, uConstantes;

type
  TPontoTrabalho = class(TRegistroQuipos)
  private
    hrnoturno_: TTime;
    hrmeianoite: TTime;
    hrnoturnof: TTime;
    hrnoturnoi: TTime;
    hratrasobase: TTime;
    Fhrextra100: TTime;
    Fcdtpabono1: integer;
    Fhrjustificada: TTime;
    Fcdtpabono6: integer;
    Fcdtpabono7: integer;
    Fcdtpabono4: integer;
    Fcdtpabono5: integer;
    Fhrponto8: TTime;
    Fhrextra50: TTime;
    Fhrtrabalhada: TTime;
    Fcdturno: integer;
    Fhrponto2: TTime;
    Fhrabonada: TTime;
    Fhrponto3: TTime;
    Fhrponto1: TTime;
    Fhrponto6: TTime;
    Fhrcredito: TTime;
    Fhrextra: TTime;
    Fhrponto7: TTime;
    Fhrponto4: TTime;
    Fhrponto5: TTime;
    Fhrnoturno: TTime;
    Fboferiado: string;
    Fcdtpabono8: integer;
    Fcdfuncionario: integer;
    Fhratraso: TTime;
    Fhrdebito: TTime;
    Fcdtpabono2: integer;
    Fdtemissao: TDate;
    Fcdtpabono3: integer;
    fcdcartaoponto: integer;
    fturno: TTurno;
    procedure CalcularHoraTrabalhada;
    procedure CalcularHoraNegativa;
    procedure CalcularHoraAtraso;
    procedure CalcularHoraNoturna;
    procedure CalcularHoraExtra;
    function idia:integer;
    function calcular_hora_periodo(hrponto, hrinicio: TTime; bocalculardebito: boolean):boolean;
    procedure calcular_hora_periodoTermino(hrponto, httermino: TTime);
  public
    property cdfuncionario : integer read Fcdfuncionario write Fcdfuncionario;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    [fk]
    property cdtpabono1 : integer read Fcdtpabono1 write Fcdtpabono1;
    [fk]
    property cdtpabono2 : integer read Fcdtpabono2 write Fcdtpabono2;
    [fk]
    property cdtpabono3 : integer read Fcdtpabono3 write Fcdtpabono3;
    [fk]
    property cdtpabono4 : integer read Fcdtpabono4 write Fcdtpabono4;
    [fk]
    property cdtpabono5 : integer read Fcdtpabono5 write Fcdtpabono5;
    [fk]
    property cdtpabono6 : integer read Fcdtpabono6 write Fcdtpabono6;
    [fk]
    property cdtpabono7 : integer read Fcdtpabono7 write Fcdtpabono7;
    [fk]
    property cdtpabono8 : integer read Fcdtpabono8 write Fcdtpabono8;
    [fk]
    property cdturno : integer read Fcdturno write Fcdturno;
    [fk]
    property cdcartaoponto : integer read fcdcartaoponto write fcdcartaoponto;
    property hrponto1 : TTime read Fhrponto1 write Fhrponto1;
    property hrponto2 : TTime read Fhrponto2 write Fhrponto2;
    property hrponto3 : TTime read Fhrponto3 write Fhrponto3;
    property hrponto4 : TTime read Fhrponto4 write Fhrponto4;
    property hrponto5 : TTime read Fhrponto5 write Fhrponto5;
    property hrponto6 : TTime read Fhrponto6 write Fhrponto6;
    property hrponto7 : TTime read Fhrponto7 write Fhrponto7;
    property hrponto8 : TTime read Fhrponto8 write Fhrponto8;
    property boferiado : string read Fboferiado write Fboferiado;
    property hrtrabalhada : TTime read Fhrtrabalhada write Fhrtrabalhada;
    property hrnoturno : TTime read Fhrnoturno write Fhrnoturno;
    property hrabonada : TTime read Fhrabonada write Fhrabonada;
    property hratraso : TTime read Fhratraso write Fhratraso;
    property hrdebito : TTime read Fhrdebito write Fhrdebito;
    property hrextra : TTime read Fhrextra write Fhrextra;
    property hrextra50 : TTime read Fhrextra50 write Fhrextra50;
    property hrextra100 : TTime read Fhrextra100 write Fhrextra100;
    property hrcredito : TTime read Fhrcredito write Fhrcredito;
    property hrjustificada : TTime read Fhrjustificada write Fhrjustificada;
    property turno : TTurno read fturno write fturno;
    constructor create;
    destructor destroy; override;
    procedure CalcularHoras;
    function ExisteOcorrenciaHoraJustificada(hremissao:TTime):Boolean;
  end;
  TPontoTrabalhoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TPontoTrabalho;
    procedure SetItem(Index: Integer; const Value: TPontoTrabalho);
  public
    function New: TPontoTrabalho;
    property Items[Index: Integer]: TPontoTrabalho read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
  end;

implementation

constructor TPontoTrabalho.create;
begin
  inherited;
  fturno := tturno.create;
  hrnoturno_ := strtotime(_00_00_00);
  hrmeianoite := strtotime(_00_00_00);
  hrnoturnof := strtotime('05:00');
  hrnoturnoi := strtotime('22:00');
  hratrasobase := strtotime('00:05:59');
end;

destructor TPontoTrabalho.destroy;
begin
  freeandnil(fturno);
  inherited;
end;

procedure TPontoTrabalho.CalcularHoras;
begin
  turno.Select(cdturno);
  turno.itturno.Ler(turno.cdturno, _cdturno);
  if turno.itturno.Count = 0 then
  begin
    messagedlg('N�o est� difinido o hor�rio para o turno '+turno.cdturno.tostring+' - '+turno.nmturno+'.', mtinformation, [mbok], 0);
    abort;
  end;
  CalcularHoraTrabalhada;
  CalcularHoraNegativa;
  CalcularHoraAtraso;
  CalcularHoraNoturna;
  CalcularHoraExtra;
end;

procedure TPontoTrabalho.CalcularHoraAtraso;
begin
  if (idia = 1) or (idia = 7) or (boferiado = _s) then
  begin
    exit;
  end;
  hratraso := StrToTime(_00_00_00);
  if hrponto1 > turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1 then
  begin
    if (hrponto1 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1) <= hratrasobase then
    begin
      hratraso := hrponto1 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1;
    end
    else
    begin
      hrdebito := hrdebito + (hrponto1 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1);
      if ExisteOcorrenciaHoraJustificada(hrponto1) then
      begin
        hrjustificada := hrjustificada + (hrponto1 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1);
      end;
    end;
  end;
  if hrponto3 > turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2 then
  begin
    if (hrponto3 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2) <= hratrasobase then
    begin
      hratraso := hratraso + (hrponto3 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
    end
    else
    begin
      hrdebito := hrdebito + (hrponto3 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
      if ExisteOcorrenciaHoraJustificada(hrponto3) then
      begin
        hrjustificada := hrjustificada + (hrponto3 - turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
      end;
    end;
  end;
end;

function TPontoTrabalho.calcular_hora_periodo(hrponto, hrinicio: TTime; bocalculardebito:boolean):boolean;
begin
  result := false;
  if (hrponto <> strtotime(_00_00_00)) and (hrponto > hrinicio) and ((hrponto - hrinicio) > hratrasobase) and bocalculardebito then
  begin
    hrdebito := hrdebito + hrponto - hrinicio;
    if bocalculardebito then
    begin
      hrjustificada := hrjustificada + hrponto - hrinicio;
    end;
    result := true;
  end;
end;

procedure TPontoTrabalho.calcular_hora_periodoTermino(hrponto, httermino: TTime);
begin
  if (hrponto <> strtotime(_00_00_00)) and (hrponto < httermino) and ((httermino - hrponto) > hratrasobase) and (idia <> 1) and (idia <> 7) and (boferiado<> _s) then
  begin
    hrdebito := hrdebito + (httermino - hrponto);
    if ExisteOcorrenciaHoraJustificada(hrponto) then
    begin
      hrjustificada := hrjustificada + (httermino - hrponto);
    end;
  end;
end;

procedure TPontoTrabalho.CalcularHoraNegativa;
begin
  hrdebito      := StrToTime(_00_00_00);
  hrabonada     := StrToTime(_00_00_00);
  hrjustificada := StrToTime(_00_00_00);

  if turno.itturno.Idia(idia) > -1 then
  begin
    calcular_hora_periodo(hrponto1, turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1, qregistro.BooleandoCodigo(_tpabono, cdtpabono1, _bocalcularjustificada));
    if not calcular_hora_periodo(hrponto2, turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1, qregistro.BooleandoCodigo(_tpabono, cdtpabono2, _bocalcularjustificada)) then
    begin
      calcular_hora_periodoTermino(hrponto2, turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1);
    end;
    calcular_hora_periodo(hrponto3, turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2, qregistro.BooleandoCodigo(_tpabono, cdtpabono3, _bocalcularjustificada));
    if not calcular_hora_periodo(hrponto4, turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2, qregistro.BooleandoCodigo(_tpabono, cdtpabono4, _bocalcularjustificada)) then
    begin
      calcular_hora_periodoTermino(hrponto4, turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2);
    end;
  end;

  if (idia <> 1) and (idia <> 7) and (boferiado <> _s) then
  begin
    if (hrponto1 = strtotime(_00_00_00)) and (hrponto2 = strtotime(_00_00_00)) then
    begin
      if qregistro.BooleandoCodigo(_tpabono, cdtpabono1, _bocalculardebito) and qregistro.BooleandoCodigo(_tpabono, cdtpabono2, _bocalculardebito) then
      begin
        hrdebito := hrdebito + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1);
        if qregistro.BooleandoCodigo(_tpabono, cdtpabono1, _bocalcularjustificada) and qregistro.BooleandoCodigo(_tpabono, cdtpabono2, _bocalcularjustificada) then
        begin
          hrjustificada := hrjustificada + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1);
        end;
      end
      else if qregistro.BooleandoCodigo(_tpabono, cdtpabono1, _bocalcularabono) and qregistro.BooleandoCodigo(_tpabono, cdtpabono2, _bocalcularabono) then
      begin
        hrabonada := hrabonada + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1);
      end
      else if qregistro.BooleandoCodigo(_tpabono, cdtpabono1, _bocalculartrabalho) and qregistro.BooleandoCodigo(_tpabono, cdtpabono2, _bocalculartrabalho) then
      begin
        hrtrabalhada := hrtrabalhada + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1);
      end
      else
      begin
        hrdebito := hrdebito + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1);
      end;
    end;
    if (hrponto3 = strtotime(_00_00_00)) and (hrponto4 <> strtotime(_00_00_00)) then
    begin
      if qregistro.BooleandoCodigo(_tpabono, cdtpabono3, _bocalculardebito) and qregistro.BooleandoCodigo(_tpabono, cdtpabono4, _bocalculardebito) then
      begin
        hrdebito := hrdebito + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
        if qregistro.BooleandoCodigo(_tpabono, cdtpabono3, _bocalcularjustificada) and qregistro.BooleandoCodigo(_tpabono, cdtpabono4, _bocalcularjustificada) then
        begin
          hrjustificada := hrjustificada + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
        end
      end
      else if qregistro.BooleandoCodigo(_tpabono, cdtpabono3, _bocalcularabono) and qregistro.BooleandoCodigo(_tpabono, cdtpabono4, _bocalcularabono) then
      begin
        hrabonada := hrabonada + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
      end
      else if qregistro.BooleandoCodigo(_tpabono, cdtpabono3, _bocalculartrabalho) and qregistro.BooleandoCodigo(_tpabono, cdtpabono4, _bocalculartrabalho) then
      begin
        hrtrabalhada := hrtrabalhada + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
      end
      else
      begin
        hrdebito := hrdebito + (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2-turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2);
      end;
    end;
  end;
end;

procedure TPontoTrabalho.CalcularHoraExtra;
var
  hrextra : TTime;
begin
  hrextra100 := strtotime(_00_00_00);
  HREXTRA50 := strtotime(_00_00_00);
  hrcredito := strtotime(_00_00_00);
  if idia = 1 then
  begin
    if hrtrabalhada > StrToTime(_00_00_00) then
    begin
      hrextra100 := hrtrabalhada;
      hrcredito  := hrtrabalhada;
    end;
  end
  else if idia = 7 then
  begin
    if hrtrabalhada > StrToTime(_00_00_00) then
    begin
      hrextra50 := hrtrabalhada;
      hrcredito := hrtrabalhada;
    end;
  end
  else if boferiado = _s then
  begin
    if hrtrabalhada > StrToTime(_00_00_00) then
    begin
      hrextra100 := hrtrabalhada;
      hrcredito  := hrtrabalhada;
    end;
  end
  else
  begin
    hrextra := StrToTime(_00_00_00);
    if (hrponto1 <> strtotime(_00_00_00)) and (hrponto1 < turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1) and ((turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1 - hrponto1) > hratrasobase) then
    begin
      hrextra := turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1 - hrponto1;
    end;
    if turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1 = 0 then
    begin
      turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1 := StrToTime('23:59:00')+StrToTime('00:01:00');
    end;
    if (hrponto2 <> strtotime(_00_00_00)) and (hrponto2 > turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1) and ((hrponto2 - turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1) > hratrasobase) then
    begin
      hrextra := hrextra + (hrponto2 - turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1);
    end;
    if (hrponto3 <> strtotime(_00_00_00)) and (hrponto3 < turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2) and ((turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2 - hrponto3) > hratrasobase) then
    begin
      hrextra := hrextra + (turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2 - hrponto3);
    end;
    if (hrponto4 <> strtotime(_00_00_00)) and (hrponto4 > turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2) and ((hrponto4 - turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2) > hratrasobase) then
    begin
      hrextra := hrextra + (hrponto4 - turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2);
    end;
    if hrextra > StrToTime(_00_00_00) then
    begin
      HREXTRA50    := hrextra;
      hrcredito    := hrextra;
      hrtrabalhada := hrtrabalhada - hrextra;
    end;
  end;
end;

procedure TPontoTrabalho.CalcularHoraTrabalhada;
var
  hrtrabalho, hr1, hr2, hr3, hr4 : TTime;
begin
  hr1 := hrponto1;
  hr2 := hrponto2;
  hr3 := hrponto3;
  hr4 := hrponto4;
  if turno.itturno.Idia(idia) > -1 then
  begin
    if (hr1 <> StrToTime(_00_00_00)) and (hr1 < turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1) and (turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1 - hr1 < hratrasobase) then
    begin
      hr1 := turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio1;
    end;
    if (hr2 <> StrToTime(_00_00_00)) and (hr2 < turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1) and (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1 - hr2 < hratrasobase) then
    begin
      hr2 := turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1;
    end;
    if (hr3 <> StrToTime(_00_00_00)) and (hr3 < turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2) and (turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2 - hr3 < hratrasobase) then
    begin
      hr3 := turno.itturno.Items[turno.itturno.Idia(idia)].hrinicio2;
    end;
    if (hr4 <> StrToTime(_00_00_00)) and (hr4 < turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2) and (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2 - hr4 < hratrasobase) then
    begin
      hr4 := turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino2;
    end;
    if (turno.itturno.Items[turno.itturno.Idia(idia)].hrtermino1 = StrToTime(_00_00_00)) and (hr2 < hr3) then
    begin
      hr2 := hr2 + StrToTime('23:59:59');
    end;
  end;
  hrtrabalho := (hr2 - hr1) + (hr4 - hr3) + (hrponto6 - hrponto5);
  if hrtrabalho > StrToTime(_00_00_00) then
  begin
    hrtrabalhada := hrtrabalho;
    if idia = 1 then
    begin
      hrextra100 := hrtrabalho;
    end;
    if idia = 7 then
    begin
      hrextra50 := hrtrabalho;
    end;
  end;
end;

procedure TPontoTrabalho.CalcularHoraNoturna;
begin
  hrnoturno := strtotime(_00_00_00);
  if hrponto4 > hrnoturnoi then
  begin
    hrnoturno_ := hrponto4 - hrnoturnoi;
  end;
  if hrponto1 < hrnoturnof then
  begin
    hrnoturno_ := hrnoturno_ + (hrponto1 - hrmeianoite);
  end;
  if hrnoturno_ > StrToTime(_00_00_00) then
  begin
    hrnoturno := hrnoturno_;
  end;
end;

function TPontoTrabalho.ExisteOcorrenciaHoraJustificada(hremissao: TTime): Boolean;
begin
  result := RetornaSQLInteger('select count(*) '+
                              'from rhocorrencia r '+
                              'inner join tprhocorrencia t on t.cdempresa=r.cdempresa and t.cdtprhocorrencia=r.cdtprhocorrencia '+
                              'where t.BOCALCULARJUSTIFICADA=''S'' and r.cdempresa='+empresa.cdempresa.tostring+' and r.cdfuncionario='+cdfuncionario.ToString+' '+
                              'and dtemissao='+getdtbanco(dtemissao)+' and hremissao='+gethrbanco(hremissao)) > 0;
end;

function TPontoTrabalho.idia: integer;
begin
  result := dayofweek(dtemissao)
end;

function TPontoTrabalhoList.GetItem(Index: Integer): TPontoTrabalho;
begin
  Result := TPontoTrabalho(Inherited Items[Index]);
end;

function TPontoTrabalhoList.Ler(DataSet: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TPontoTrabalhoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_PontoTrabalho, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TPontoTrabalhoList.New: TPontoTrabalho;
begin
  Result := TPontoTrabalho.Create;
  Add(Result);
end;

procedure TPontoTrabalhoList.SetItem(Index: Integer; const Value: TPontoTrabalho);
begin
  Put(Index, Value);
end;

end.
