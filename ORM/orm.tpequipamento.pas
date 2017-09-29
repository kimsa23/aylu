unit orm.tpequipamento;

interface

uses uConstantes,
  Classe.DAO;

type
  Ttpequipamento = class(TRegistroQuipos)
  private
    Fbodsobservacao: String;
    Fboreferenciaformulacao: String;
    Fbomarca: String;
    Fbonuchassi: String;
    Fbonuestrutural: String;
    Fbomodeloobrigatorio: String;
    Fbovlhora: String;
    Fbopesagem: String;
    Fbocliente: String;
    Fbomedidor: String;
    Fboqtproducao: String;
    Fboapontamentoturma: String;
    Fboapontamento: String;
    Fbojustificativastatus: String;
    Fboqtitem: String;
    Fboqtproducaopreenchida: String;
    Fbobaixaestoqueautomatico: String;
    Fbobaixaestoque: String;
    Fboapontamentotpestado: String;
    Fbocomprimento: String;
    Fbonuserieduplicado: String;
    Fbonuplaca: String;
    Fboproduto: String;
    Fbovlequipamento: String;
    Fboqtmistura: String;
    Fbocor: String;
    Fbovibracao: String;
    Fbonuchassio: String;
    Fboquociente: String;
    Fboequipamento: String;
    Fboreaproveitar: String;
    Fbonuserie: String;
    Fbomanualdataunica: String;
    Fbotemperatura: String;
    Fboapontamentorosca: String;
    Fbofaixa: String;
    Fboequipamentoanterior: String;
    Fboqtpeca: String;
    Fbomarcaobrigatorio: String;
    Fbonupatrimonioo: String;
    Fbopertenceempresa: String;
    Fbonuestruturalobrigatorio: String;
    Fboapontamentotempo: String;
    Fboapontamentoestanqueidade: String;
    Fboautorizada: String;
    Fbopsmistura: String;
    Fboqtrefugo: String;
    Fbonuano: String;
    Fbonupatrimonio: String;
    Fboeletricpneum: String;
    Fbonuserieo: String;
    Fvloperacao: Currency;
    Fvlpreparacao: Currency;
    Fvldiagnostico: Currency;
    Fcdcomputador: Integer;
    Fcdstordproducao: Integer;
    Fcdfuncionario: Integer;
    Fcdequipamento: Integer;
    Fcdtpequipamento: Integer;
    Fnmtpequipamento: string;
    Ftpview: string;
    fbomodelo: String;
    Fbotpequipamento2: String;
    fbocntcusto: string;
  public
    [keyfield]
    property cdtpequipamento : Integer read Fcdtpequipamento write fcdtpequipamento;
    [fk]
    property cdequipamento : Integer read Fcdequipamento write fcdequipamento;
    [fk]
    property cdcomputador : Integer read Fcdcomputador write fcdcomputador;
    [fk]
    property cdfuncionario : Integer read Fcdfuncionario write fcdfuncionario;
    [fk]
    property cdstordproducao : Integer read Fcdstordproducao write fcdstordproducao;
    property nmtpequipamento : string read Fnmtpequipamento write fnmtpequipamento;
    property boautorizada : String read Fboautorizada write fboautorizada;
    property bonuserie : String read Fbonuserie write fbonuserie;
    property bonupatrimonio : String read Fbonupatrimonio write fbonupatrimonio;
    property bonupatrimonioo : String read Fbonupatrimonioo write fbonupatrimonioo;
    property bonuchassi : String read Fbonuchassi write fbonuchassi;
    property bonuchassio : String read Fbonuchassio write fbonuchassio;
    property bonuplaca : String read Fbonuplaca write fbonuplaca;
    property bocor : String read Fbocor write fbocor;
    property bonuano : String read Fbonuano write fbonuano;
    property bonuserieduplicado : String read Fbonuserieduplicado write fbonuserieduplicado;
    property bonuserieo : String read Fbonuserieo write Fbonuserieo;
    property bomodelo : String read fbomodelo write fbomodelo;
    property bomarca : String read Fbomarca write fbomarca;
    property boproduto : String read Fboproduto write fboproduto;
    property boeletricpneum : String read Fboeletricpneum write fboeletricpneum;
    property bovlequipamento : String read Fbovlequipamento write fbovlequipamento;
    property bopertenceempresa : String read Fbopertenceempresa write fbopertenceempresa;
    property bovlhora : String read Fbovlhora write fbovlhora;
    property bomedidor : String read Fbomedidor write fbomedidor;
    property boequipamento : String read Fboequipamento write fboequipamento;
    property vlpreparacao : Currency read Fvlpreparacao write fvlpreparacao;
    property vloperacao : Currency read Fvloperacao write fvloperacao;
    property boqtitem : String read Fboqtitem write fboqtitem;
    property bocliente : String read Fbocliente write fbocliente;
    property bojustificativastatus : String read Fbojustificativastatus write fbojustificativastatus;
    property bomarcaobrigatorio : String read Fbomarcaobrigatorio write fbomarcaobrigatorio;
    property bomodeloobrigatorio : String read Fbomodeloobrigatorio write fbomodeloobrigatorio;
    property bobaixaestoque : String read Fbobaixaestoque write fbobaixaestoque;
    property boapontamento : String read Fboapontamento write fboapontamento;
    property bobaixaestoqueautomatico : String read Fbobaixaestoqueautomatico write fbobaixaestoqueautomatico;
    property botemperatura : String read Fbotemperatura write fbotemperatura;
    property bovibracao : String read Fbovibracao write fbovibracao;
    property boapontamentoturma : String read Fboapontamentoturma write fboapontamentoturma;
    property bopesagem : String read Fbopesagem write fbopesagem;
    property bocomprimento : String read Fbocomprimento write fbocomprimento;
    property boreaproveitar : String read Fboreaproveitar write fboreaproveitar;
    property boapontamentotempo : String read Fboapontamentotempo write fboapontamentotempo;
    property boequipamentoanterior : String read Fboequipamentoanterior write fboequipamentoanterior;
    property boqtmistura : String read Fboqtmistura write fboqtmistura;
    property bopsmistura : String read Fbopsmistura write fbopsmistura;
    property boreferenciaformulacao : String read Fboreferenciaformulacao write fboreferenciaformulacao;
    property bofaixa : String read Fbofaixa write fbofaixa;
    property boqtproducao : String read Fboqtproducao write fboqtproducao;
    property boqtproducaopreenchida : String read Fboqtproducaopreenchida write fboqtproducaopreenchida;
    property boqtrefugo : String read Fboqtrefugo write fboqtrefugo;
    property boquociente : String read Fboquociente write fboquociente;
    property bodsobservacao : String read Fbodsobservacao write fbodsobservacao;
    property bonuestrutural : String read Fbonuestrutural write fbonuestrutural;
    property bomanualdataunica : String read Fbomanualdataunica write fbomanualdataunica;
    property boapontamentorosca : String read Fboapontamentorosca write fboapontamentorosca;
    property boapontamentoestanqueidade : String read Fboapontamentoestanqueidade write fboapontamentoestanqueidade;
    property boapontamentotpestado : String read Fboapontamentotpestado write fboapontamentotpestado;
    property tpview : string read Ftpview write ftpview;
    property vldiagnostico : Currency read Fvldiagnostico write fvldiagnostico;
    property bonuestruturalobrigatorio : String read Fbonuestruturalobrigatorio write fbonuestruturalobrigatorio;
    property boqtpeca : String read Fboqtpeca write fboqtpeca;
    property botpequipamento2 : String read Fbotpequipamento2 write Fbotpequipamento2;
    property bocntcusto: string read fbocntcusto write fbocntcusto;
    function get_visualizar_dados: Boolean;
  end;

implementation

function Ttpequipamento.get_visualizar_dados: Boolean;
begin
  Result := (botemperatura =_s) or
            (bovibracao =_s) or
            (bopsmistura =_s) or
            (bonuestrutural =_s) or
            (boqtrefugo =_s) or
            (boqtproducao =_s) or
            (boqtpeca =_s) or
            (boqtmistura =_s)
end;

end.
