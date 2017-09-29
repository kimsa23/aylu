unit orm.TpOrdCompra;

interface

uses System.SysUtils,
  Rotina.Retornasql,
  ORM.Empresa,
  Classe.DAO;

type
  TTpOrdCompra = class(TRegistroQuipos)
  private
    Fbocertificado: String;
    Fboipi: String;
    Fboitemdsobservacao: String;
    Fbomodelo3: String;
    Fbocntcustoobrigatorio: String;
    Fboaplicacaodigitar: String;
    Fbomodelo1: String;
    Fboiqf: String;
    Fbotpaplicacaoitens: String;
    Fbotransportadora: String;
    Fbolocaldigitar: String;
    Fboitpedido: String;
    Fboitemdsformula: String;
    Fbosolicitantedigitar: String;
    Fboitemcertificado: String;
    Fbomodelo2: String;
    Fboaprovacao: String;
    Fboitemqtpeca: String;
    Fboaprovacaofinanceiro: String;
    Fboitemkm: String;
    Fboobservacaotpordcompra: String;
    Fbomodelo4: String;
    Fboformula: String;
    Fcdtpordcompra: Integer;
    Fdsassuntoemail: string;
    Fdsobservacao: string;
    Fdsversaodocumento: string;
    Fdstituloemail: string;
    Femailcopia: string;
    Fnmtpordcompra: string;
    fboitemnuclfiscal: string;
    fboitemnusticms: string;
    fboitemorcamento: string;
  public
    [keyfield]
    property cdtpordcompra : Integer read Fcdtpordcompra write Fcdtpordcompra;
    property nmtpordcompra : string read Fnmtpordcompra write Fnmtpordcompra;
    property boipi : String read Fboipi write Fboipi;
    property bomodelo1 : String read Fbomodelo1 write Fbomodelo1;
    property bomodelo2 : String read Fbomodelo2 write Fbomodelo2;
    property bomodelo3 : String read Fbomodelo3 write Fbomodelo3;
    property botpaplicacaoitens : String read Fbotpaplicacaoitens write Fbotpaplicacaoitens;
    property boaplicacaodigitar : String read Fboaplicacaodigitar write Fboaplicacaodigitar;
    property dsversaodocumento : string read Fdsversaodocumento write Fdsversaodocumento;
    property bolocaldigitar : String read Fbolocaldigitar write Fbolocaldigitar;
    property bosolicitantedigitar : String read Fbosolicitantedigitar write Fbosolicitantedigitar;
    property boformula : String read Fboformula write Fboformula;
    property boitpedido : String read Fboitpedido write Fboitpedido;
    property bomodelo4 : String read Fbomodelo4 write Fbomodelo4;
    property boaprovacao : String read Fboaprovacao write Fboaprovacao;
    property dstituloemail : string read Fdstituloemail write Fdstituloemail;
    property dsassuntoemail : string read Fdsassuntoemail write Fdsassuntoemail;
    property emailcopia : string read Femailcopia write Femailcopia;
    property bocntcustoobrigatorio : String read Fbocntcustoobrigatorio write Fbocntcustoobrigatorio;
    property bocertificado : String read Fbocertificado write Fbocertificado;
    property boobservacaotpordcompra : String read Fboobservacaotpordcompra write Fboobservacaotpordcompra;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property boiqf : String read Fboiqf write Fboiqf;
    property boitemdsformula : String read Fboitemdsformula write Fboitemdsformula;
    property boitemdsobservacao : String read Fboitemdsobservacao write Fboitemdsobservacao;
    property boitemqtpeca : String read Fboitemqtpeca write Fboitemqtpeca;
    property boitemcertificado : String read Fboitemcertificado write Fboitemcertificado;
    property boitemkm : String read Fboitemkm write Fboitemkm;
    property botransportadora : String read Fbotransportadora write Fbotransportadora;
    property boaprovacaofinanceiro : String read Fboaprovacaofinanceiro write Fboaprovacaofinanceiro;
    property boitemnuclfiscal : string read fboitemnuclfiscal write fboitemnuclfiscal;
    property boitemnusticms : string read fboitemnusticms write fboitemnusticms;
    property boitemorcamento : string read fboitemorcamento write fboitemorcamento;
    class function Count:integer;
    class function PrimeiroCodigo:string;
  end;

implementation

class function TTpOrdCompra.Count: integer;
begin
  result := RetornaSQLInteger('select count(*) from tpordcompra where cdempresa='+empresa.cdempresa.tostring);
end;

class function TTpOrdCompra.PrimeiroCodigo: string;
begin
  result := RetornaSQLString('select first 1 cdtpordcompra from tpordcompra where cdempresa='+empresa.cdempresa.tostring);
end;

end.
