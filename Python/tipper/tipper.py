# -*- coding: utf-8 -*-
# author : A. Mhamdi

import sys
from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from fis import Tipper


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        self.tipper = Tipper()
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.resize(150, 188)
        font = QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        sizePolicy = QSizePolicy(QSizePolicy.Preferred, QSizePolicy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(
            MainWindow.sizePolicy().hasHeightForWidth())
        MainWindow.setSizePolicy(sizePolicy)
        centralwidget = QWidget(MainWindow)
        centralwidget.setObjectName(u"centralwidget")
        MainWindow.setCentralWidget(centralwidget)
        tipBtn = QPushButton(centralwidget)
        tipBtn.setObjectName(u"tipBtn")
        tipBtn.setGeometry(QRect(10, 110, 61, 51))
        tipBtn.clicked.connect(self.on_tipBtn_clicked)
        tipBtn.setFont(font)
        service_label = QLabel(centralwidget)
        service_label.setObjectName(u"label")
        service_label.setGeometry(QRect(10, 80, 61, 19))
        service_label.setFont(font)
        service_label.setTextFormat(Qt.MarkdownText)
        food_label = QLabel(centralwidget)
        food_label.setObjectName(u"food_label")
        food_label.setGeometry(QRect(10, 50, 81, 31))
        food_label.setFont(font)
        food_label.setTextFormat(Qt.MarkdownText)
        food = QLineEdit(centralwidget)
        food.setObjectName(u"food")
        food.setGeometry(QRect(80, 54, 61, 21))
        service = QLineEdit(centralwidget)
        service.setObjectName(u"service")
        service.setGeometry(QRect(80, 80, 61, 21))
        service.setToolTipDuration(5)
        tip = QLCDNumber(centralwidget)
        tip.setObjectName(u"tip")
        tip.setGeometry(QRect(80, 110, 61, 51))
        tip.setStyleSheet(
            "QLCDNumber { background-color: black }")
        textBrowser = QTextBrowser(centralwidget)
        textBrowser.setObjectName(u"textBrowser")
        textBrowser.setGeometry(QRect(10, 10, 131, 31))
        statusbar = QStatusBar(MainWindow)
        statusbar.setObjectName(u"statusbar")
        MainWindow.setStatusBar(statusbar)

        self.service_label = service_label
        self.food_label = food_label
        self.textBrowser = textBrowser

        self.service = service
        self.food = food
        self.tip = tip

        self.tipBtn = tipBtn

        self.retranslateUi(MainWindow)
        QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate(
            "MainWindow", u"MainWindow", None))
# if QT_CONFIG(tooltip)
        self.tipBtn.setToolTip(QCoreApplication.translate(
            "MainWindow", u"<html><head/><body><p><span style=\" font-size:10pt; font-weight:400; font-style:italic;\">The amount of tip to give.</span></p></body></html>", None))
# endif // QT_CONFIG(tooltip)
        self.tipBtn.setText(QCoreApplication.translate(
            "MainWindow", u"TIP", None))
        self.service_label.setText(QCoreApplication.translate(
            "MainWindow", u"**Service:**", None))
        self.food_label.setText(QCoreApplication.translate(
            "MainWindow", u"**Food:**", None))
# if QT_CONFIG(tooltip)
        self.food.setToolTip(QCoreApplication.translate(
            "MainWindow", u"<html><head/><body><p><span style=\" font-size:10pt; font-style:italic;\">Rate the food quality.</span></p></body></html>", None))
# endif // QT_CONFIG(tooltip)
# if QT_CONFIG(tooltip)
        self.service.setToolTip(QCoreApplication.translate(
            "MainWindow", u"<html><head/><body><p><span style=\" font-size:10pt; font-style:italic;\">Rate the service quality.</span></p></body></html>", None))
# endif // QT_CONFIG(tooltip)
# if QT_CONFIG(tooltip)
        self.tip.setToolTip("")
# endif // QT_CONFIG(tooltip)
        self.textBrowser.setHtml(QCoreApplication.translate("MainWindow", u"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
                                                            "<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
                                                            "p, li { white-space: pre-wrap; }\n"
                                                            "</style></head><body style=\" font-family:'Ubuntu'; font-size:11pt; font-weight:400; font-style:normal;\" bgcolor=\"#dd0000\">\n"
                                                            "<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; font-weight:600; color:#000000;\">Tipper Problem</span></p></body></html>", None))

    def on_tipBtn_clicked(self):
        service = self.service.text()
        food = self.food.text()

        try:
            service = float(service)
            food = float(food)
            self.tipper.evaluate_fis({'food': food, 'service': service})
            self.tip.display(self.tipper.tip)
        except ValueError:
            self.tip.display(0)
            return


if __name__ == "__main__":
    app = QApplication(sys.argv)
    MainWindow = QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    ui.on_tipBtn_clicked()
    sys.exit(app.exec_())
