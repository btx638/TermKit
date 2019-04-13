//
//  Events.swift
//  TermKit
//
//  Created by Miguel de Icaza on 4/9/19.
//  Copyright © 2019 Miguel de Icaza. All rights reserved.
//

import Foundation

/**
 * The Key enumeration contains special encoding for some keys, but can also
 * encode all the unicode values that can be passed.
 *
 * If the SpecialMask is set, then the value is that of the special mask,
 * otherwise, the value is the one of the lower bits (as extracted by CharMask)
 *
 *  Control keys are the values between 1 and 26 corresponding to Control-A to Control-Z
 *
 * UnicodeScalars are also stored here, the letter 'A" for example is encoded as a value 65 (not surfaced in the enum).
 */
public enum Key : UInt32 {
    case CharMask = 0xfffff
    case SpecialMask = 0xfff00000
    
    case ControlSpace = 0
    /// The key code for the user pressing Control-A
    case ControlA = 1
    /// The key code for the user pressing Control-B
    case ControlB = 2
    /// The key code for the user pressing Control-C
    case ControlC = 3
    /// The key code for the user pressing Control-D
    case ControlD = 4
    /// The key code for the user pressing Control-E
    case ControlE = 5
    /// The key code for the user pressing Control-F
    case ControlF = 6
    /// The key code for the user pressing Control-G
    case ControlG = 7
    /// The key code for the user pressing Control-H
    case ControlH = 8
    /// The key code for the user pressing Control-I
    case ControlI = 9
    /// The key code for the user pressing Control-J
    case ControlJ = 10
    /// The key code for the user pressing Control-K
    case ControlK = 11
    /// The key code for the user pressing Control-L
    case ControlL = 12
    /// The key code for the user pressing Control-M
    case ControlM = 13
    /// The key code for the user pressing Control-N
    case ControlN = 14
    /// The key code for the user pressing Control-O
    case ControlO = 15
    /// The key code for the user pressing Control-P
    case ControlP = 16
    /// The key code for the user pressing Control-Q
    case ControlQ = 17
    /// The key code for the user pressing Control-R
    case ControlR = 18
    /// The key code for the user pressing Control-S
    case ControlS = 19
    /// The key code for the user pressing Control-T
    case ControlT = 20
    /// The key code for the user pressing Control-U
    case ControlU = 21
    /// The key code for the user pressing Control-V
    case ControlV = 22
    /// The key code for the user pressing Control-W
    case ControlW = 23
    /// The key code for the user pressing Control-X
    case ControlX = 24
    /// The key code for the user pressing Control-Y
    case ControlY = 25
    /// The key code for the user pressing Control-Z
    case ControlZ = 26

    /// The  key code for the user pressing the ESC key
    case Esc = 27

    /// The keycode for the spacebar
    case Space = 32
    
    /// The keycode for the user pressing the delete key
    case Delete = 127
    
    /// When this value is set, the key encodes the sequence Alt-keysequence
    /// and the actual value must be extracted by removing the AltMask
    case AltMask = 0x80000000
    
    /// The backspace key
    case Backspace = 0x100000
    
    /// Cursor up key pressed
    case CursorUp
    /// Cursor down key pressed
    case CursorDown
    /// Cursor left key pressed
    case CursorLeft
    /// Cursor right key pressed
    case CursorRight
    /// Page up key pressed
    case PageUp
    /// Page down key pressed
    case PageDown
    /// Home key pressed
    case Home
    /// End key pressed
    case End
    /// Delete character key
    case DeleteChar
    /// Insert character key
    case InsertChar
    /// The F1 Key
    case F1
    /// The F2 Key
    case F2
    /// The F3 Key
    case F3
    /// The F4 Key
    case F4
    /// The F5 Key
    case F5
    /// The F6 Key
    case F6
    /// The F7 Key
    case F7
    /// The F8 Key
    case F8
    /// The F9 Key
    case F9
    /// The F10 Key
    case F10
    /// The shift-tab key
    case Backtab
    case Unknown
}

/**
 * Describes a key event
 */
public struct KeyEvent {
    /// Symbolic definition of the key
    public var key : Key
    
    /// The key value cast to an integer, you will typicall use this for
    /// extracting the Unicode rune value out of a key, when none of the
    ///  symbolic options are in use.
    public var KeyValue : UInt32 {
        get {
            return key.rawValue
        }
    }
    
    /// Gets a value indicating whether the Alt key was pressed (real or synthesized)
    public var isAlt : Bool {
        get {
            return  (key.rawValue & 0x80000000) != 0
        }
    }
    
    /// Determines whether the value is a control key
    public var isControl : Bool {
        get {
            let k = key.rawValue
            return k >= 1 && k <= 26
        }
    }
    
    init (key : Key)
    {
        self.key = key
    }
}

/**
 * Flags for a mouse event
 */
public struct MouseFlags : OptionSet {
    public let rawValue : Int32
    
    public init (rawValue :Int32)
    {
        self.rawValue = rawValue
    }
    
    static let button1Pressed        = MouseFlags(rawValue: 0x2)
    static let button1Released       = MouseFlags(rawValue: 0x1)
    static let button1Clicked        = MouseFlags(rawValue: 0x4)
    static let button1DoubleClicked  = MouseFlags(rawValue: 0x8)
    static let button1TripleClicked  = MouseFlags(rawValue: 0x10)
    static let button2Pressed        = MouseFlags(rawValue: 0x80)
    static let button2Released       = MouseFlags(rawValue: 0x40)
    static let button2Clicked        = MouseFlags(rawValue: 0x100)
    static let button2DoubleClicked  = MouseFlags(rawValue: 0x200)
    static let button2TrippleClicked = MouseFlags(rawValue: 0x400)
    static let button3Pressed        = MouseFlags(rawValue: 0x2000)
    static let button3Released       = MouseFlags(rawValue: 0x1000)
    static let button3Clicked        = MouseFlags(rawValue: 0x4000)
    static let button3DoubleClicked  = MouseFlags(rawValue: 0x8000)
    static let button3TripleClicked  = MouseFlags(rawValue: 0x10000)
    static let button4Pressed        = MouseFlags(rawValue: 0x80000)
    static let button4Released       = MouseFlags(rawValue: 0x40000)
    static let button4Clicked        = MouseFlags(rawValue: 0x100000)
    static let button4DoubleClicked  = MouseFlags(rawValue: 0x200000)
    static let button4TripleClicked = MouseFlags(rawValue:  0x400000)
    
    /// The shift key was pressed when the mouse event was produced
    static let buttonShift = MouseFlags(rawValue: 0x2000000)
    /// The control key was pressed when the mouse event was produced
    static let buttonCtrl  = MouseFlags(rawValue: 0x1000000)
    /// The alt key was pressed when the mouse event was produced
    static let buttonAlt   = MouseFlags(rawValue: 0x4000000)
    
    static let mousePosition = MouseFlags (rawValue: 0x8000000)
}

/**
 * Describes a mouse event
 */
public struct MouseEvent {
    /// The X (column) location for the mouse event
    public var x : Int
    /// The Y (row) location for the mouse event
    public var y : Int
    
    /// The event flags
    public var flags : MouseFlags

    init (x: Int, y:Int, flags: MouseFlags)
    {
        self.x = x
        self.y = y
        self.flags = flags
    }
}