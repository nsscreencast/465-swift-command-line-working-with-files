import ArgumentParser
import Files

// swift-encode <input_file> -o output
struct Encode: ParsableCommand {
    @Argument(help: "The input movie file to encode")
    var inputFile: String
    
    @Option(name: [.short, .customLong("out")], help: "The output directory in which to place the encoded files.")
    var outputDirectory: String = "output"

    func run() throws {
        print("Running swift-encode...")
        print("Input file: \(inputFile)")
        print("Output dir: \(outputDirectory)")
        
        let file = try File(path: inputFile)
        print(file)
        
        let output = try Folder.current.createSubfolderIfNeeded(withName: outputDirectory)
        
        print(output)
    }
}

Encode.main()
