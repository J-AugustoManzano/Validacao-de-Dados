import scala.io.StdIn.readLine

case class Data(
  var dia: Short, 
  var mes: Short, 
  var ano: Short, 
  var ok:  Boolean
)

object Main {
  def StrToInt(cadeia: String): Int = {
    var valor = 0
    var sinal = 1
    if (cadeia.isEmpty)
      return 0
    if (cadeia(0) == '-') {
      sinal = -1
      for (i <- 1 until cadeia.length) {
        if (!Character.isDigit(cadeia(i)))
          return 0
        valor = valor * 10 + cadeia(i) - '0'
      }
    } else {
      for (i <- 0 until cadeia.length) {
        if (!Character.isDigit(cadeia(i)))
          return 0
        valor = valor * 10 + cadeia(i) - '0'
      }
    }
    valor * sinal
  }

  def IntToStr(valor: Int): String = {
    valor.toString
  }

  def Formatar(valor: Int, digitos: Int): String = {
    var valorCadeia = IntToStr(valor)
    while (valorCadeia.length < digitos)
      valorCadeia = '0' + valorCadeia
    valorCadeia
  }

  def anoBissexto(data: Data): Boolean = {
    if (data.ano % 400 == 0)
      true
    else if ((data.ano % 4 == 0) && (data.ano % 100 != 0))
      true
    else
      false
  }

  def ultimoDiaMes(data: Data): Int = {
    if (data.mes == 2)
      if (anoBissexto(data)) 29 else 28
    else if (data.mes <= 7)
      if (data.mes % 2 != 0) 31 else 30
    else
      if (data.mes % 2 != 0) 30 else 31
  }

  def validaData(data: Data): Unit = {
    data.ok = (data.ano >=    1) && 
              (data.ano <= 9999) &&
              (data.mes >=    1) && 
              (data.mes <=   12) &&
              (data.dia >=    1) && 
              (data.dia <= ultimoDiaMes(data)) &&
            !((data.ano == 1582) &&
              (data.mes ==   10) &&
              (data.dia >=    5) &&
              (data.dia <=   14))
  }

  def alteraData(data: Data, dia: Int, mes: Int, ano: Int): Unit = {
    data.dia = dia.toShort
    data.mes = mes.toShort
    data.ano = ano.toShort
    validaData(data)
  }

  def mostraData(data: Data): Unit = {
    if (data.ok)
      println(s"${Formatar(data.dia, 2)}/${Formatar(data.mes, 2)}/${Formatar(data.ano, 4)}")
    else
      println("**/**/****")
  }

  def main(args: Array[String]): Unit = {
    println("TESTE DE VALIDACAO DE DATA (CALENDARIO)")
    println("=======================================")
    println()
    print("Entre data no formato DD/MM/AAAA: ")

    val DTS = readLine()

    val DIA = StrToInt(DTS.substring(0, 2))
    val MES = StrToInt(DTS.substring(3, 5))
    val ANO = StrToInt(DTS.substring(6, 10))

    val data = Data(0, 0, 0, false)
    alteraData(data, DIA, MES, ANO)

    print("Data informada: ")
    mostraData(data)

    println()
    print("Tecle <Enter> para encerrar... ")
    readLine()
  }
}
