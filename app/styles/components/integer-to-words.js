/*
	stylus-boilerplate

	integer-to-words.js

	@author Sean Goresht

	@note Created on 2015-01-02 by PhpStorm
*/


/*
	Convert an integer to an English string equivalent
	@param {Integer} number the integer to be converted
	@return {String} the English number equivalent
*/

(function () {
	var intToWord;

	intToWord = function (number) {

		var englishIntegers = [
			"",
			"one",
			"two",
			"three",
			"four",
			"five",
			"six",
			"seven",
			"eight",
			"nine",
			"ten",
			"eleven",
			"twelve",
			"thirteen",
			"fourteen",
			"fifteen",
			"sixteen",
			"seventeen",
			"eighteen",
			"nineteen"
		];

		var englishTens = [
			"",
			"",
			"twenty",
			"thirty",
			"forty",
			"fifty",
			"sixty",
			"seventy",
			"eighty",
			"ninety"
		];

		var englishThousands = [
			"thousand",
			"million",
			""
		];

		number = number.toString();

		if (number.length > 9) {

			return ""; // Number is larger than what function can deal with

		}

		number = ("000000000" + number).substr(-9); // // Make number into a predictiable nine character string

		number = number.match(/.{3}/g); // Split string into chuncks of three numbers then reverse order of returned array

		var words = "";

		for (var i = 0; i < englishThousands.length; i++) {

			var n = number[i];

			var str = "";

			str += (words != "") ? " " + englishThousands[i] + "-" : "";

			str += (n[0] != 0) ? (englishIntegers[Number(n[0])] + "-hundred") : "";

			n = n.substr(1);

			str += (n != 0) ? ((str != "") ? "-" : "" ) + (englishIntegers[Number(n)] || englishTens[n[0]] + " " + englishIntegers[n[1]]) : "";

			words += str;

		}

		return words;
	};

	if (typeof module !== "undefined" && module !== null) {
		module.exports = function () {
			return function (stylus) {
				return stylus.define("int-to-word", function (node) {
					var nodeName;
					nodeName = node.nodeName;
					if (nodeName === "unit") {
						console.dir(node);
						return new stylus.nodes.String(intToWord(node.val));
					}
					else {
						throw new Error("int-to-word only accepts integers but got " + nodeName);
					}
				});
			};
		};
	}

}).call(this);
