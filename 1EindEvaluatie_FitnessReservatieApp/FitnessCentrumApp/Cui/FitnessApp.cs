using Domein;
using System;
using System.Collections.Generic;

namespace Cui {
    public class FitnessApp {
        private DomeinController _domeinController;

        public FitnessApp(DomeinController domeinController) {
            _domeinController = domeinController;
        }

        /// <summary>
        /// Menu maken
        /// </summary>
        /// <param name="prompt"></param>
        /// <param name="options"></param>
        /// <param name="cancelOption"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        public int MakeChoiceFromOptions(string prompt, List<string> options, string cancelOption) {
            bool validInput = true;
            int input = 1;
            do {
                try {
                    Console.WriteLine(prompt);
                    for (int i = 0; i < options.Count; i++) {
                        Console.WriteLine($"{i + 1}. {options[i]}");
                    }
                    Console.WriteLine($"0. {cancelOption}\nPick an option\n");
                    input = int.Parse(Console.ReadLine());
                }
                catch (ArgumentException) {
                    throw new ArgumentException($"Choice must be between 0 & {options.Count}");
                    validInput = false;
                }
            } while (!validInput);
            return input;
        }
    }
}
