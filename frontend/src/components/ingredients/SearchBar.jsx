import React, { useState, useRef, useEffect } from 'react';
import { Search, Mic, X, Loader2 } from 'lucide-react';

/**
 * SearchBar - Search input with autocomplete dropdown.
 * 
 * @param {Object} props
 * @param {string} props.value - Current search value
 * @param {function} props.onChange - Called when input changes
 * @param {function} props.onSelect - Called when suggestion selected
 * @param {Array} props.suggestions - Autocomplete suggestions
 * @param {boolean} props.isLoading - Show loading spinner
 * @param {string} props.placeholder - Input placeholder text
 */
export default function SearchBar({
  value = '',
  onChange,
  onSelect,
  suggestions = [],
  isLoading = false,
  placeholder = 'search for an ingredient'
}) {
  const [showDropdown, setShowDropdown] = useState(false);
  const [focusedIndex, setFocusedIndex] = useState(-1);
  const inputRef = useRef(null);
  const dropdownRef = useRef(null);

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (
        dropdownRef.current && 
        !dropdownRef.current.contains(e.target) &&
        !inputRef.current.contains(e.target)
      ) {
        setShowDropdown(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const handleInputChange = (e) => {
    onChange(e.target.value);
    setShowDropdown(e.target.value.length >= 2);
    setFocusedIndex(-1);
  };

  const handleSelect = (suggestion) => {
    onSelect(suggestion.ingredient_name);
    setShowDropdown(false);
    setFocusedIndex(-1);
  };

  const handleKeyDown = (e) => {
    if (!showDropdown || suggestions.length === 0) return;

    if (e.key === 'ArrowDown') {
      e.preventDefault();
      setFocusedIndex(prev => 
        prev < suggestions.length - 1 ? prev + 1 : 0
      );
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      setFocusedIndex(prev => 
        prev > 0 ? prev - 1 : suggestions.length - 1
      );
    } else if (e.key === 'Enter' && focusedIndex >= 0) {
      e.preventDefault();
      handleSelect(suggestions[focusedIndex]);
    } else if (e.key === 'Escape') {
      setShowDropdown(false);
    }
  };

  const handleClear = () => {
    onChange('');
    setShowDropdown(false);
    inputRef.current?.focus();
  };

  return (
    <div className="relative w-full max-w-xl mx-auto">
      {/* Search Input */}
      <div className="relative">
        <Search 
          size={20} 
          className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"
        />
        
        <input
          ref={inputRef}
          type="text"
          value={value}
          onChange={handleInputChange}
          onFocus={() => value.length >= 2 && setShowDropdown(true)}
          onKeyDown={handleKeyDown}
          placeholder={placeholder}
          className="w-full py-3 pl-12 pr-20 text-base border-2 border-gray-200 rounded-full bg-white outline-none transition-all focus:border-[#2D7D5E] focus:shadow-[0_0_0_3px_rgba(45,125,94,0.1)]"
          style={{ fontFamily: 'Inter, sans-serif' }}
        />
        
        <div className="absolute right-4 top-1/2 -translate-y-1/2 flex items-center gap-2">
          {isLoading && (
            <Loader2 size={20} className="text-gray-400 animate-spin" />
          )}
          
          {value && !isLoading && (
            <button
              onClick={handleClear}
              className="text-gray-400 hover:text-gray-600 transition-colors"
              aria-label="Clear search"
            >
              <X size={20} />
            </button>
          )}
          
          <Mic 
            size={20} 
            className="text-gray-400 cursor-pointer hover:text-gray-600 transition-colors"
          />
        </div>
      </div>

      {/* Autocomplete Dropdown */}
      {showDropdown && suggestions.length > 0 && (
        <div 
          ref={dropdownRef}
          className="absolute top-full left-0 right-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg max-h-80 overflow-y-auto z-10"
        >
          {suggestions.map((suggestion, idx) => (
            <div
              key={suggestion.ingredient_name}
              onClick={() => handleSelect(suggestion)}
              className={`px-4 py-3 cursor-pointer border-b border-gray-100 last:border-b-0 transition-colors ${focusedIndex === idx ? 'bg-gray-100' : 'hover:bg-gray-50'}`}
            >
              <div className="flex items-center justify-between">
                <span className="text-sm text-gray-900">
                  {suggestion.ingredient_name}
                </span>
                {suggestion.category && (
                  <span className="text-xs text-gray-400 capitalize">
                    {suggestion.category.replace('_', ' ')}
                  </span>
                )}
              </div>
            </div>
          ))}
        </div>
      )}

      {/* No results message */}
      {showDropdown && value.length >= 2 && suggestions.length === 0 && !isLoading && (
        <div className="absolute top-full left-0 right-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg p-4 z-10">
          <p className="text-sm text-gray-500 text-center">
            No ingredients found for "{value}"
          </p>
        </div>
      )}
    </div>
  );
}
