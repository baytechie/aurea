// IngredientSearch.jsx
// Complete React component with your design system

import React, { useState } from 'react';
import { Search, Mic, Heart, AlertCircle } from 'lucide-react';

export default function IngredientSearch() {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedIngredient, setSelectedIngredient] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [showDropdown, setShowDropdown] = useState(false);
  const [saved, setSaved] = useState(false);

  // Mock ingredient data
  const mockIngredients = {
    sugar: {
      name: 'Sugar',
      overallScore: 85,
      riskLevel: 'Low Concern',
      description: 'Based on current evidence, this product shows a low health impact for most people.',
      categories: {
        bloodSugar: {
          score: 50,
          title: 'Blood Sugar Impact',
          description: 'How this ingredient affects blood glucose levels',
          details: ['Added sugars', 'Refined starches', 'Low fiber relative to carbs']
        },
        inflammation: {
          score: 50,
          title: 'Inflammation Potential',
          description: 'Ingredients commonly associated with inflammatory responses',
          details: ['Certain refined oils', 'Excessive ultra-processing', 'Additives with mixed evidence']
        },
        gut: {
          score: 50,
          title: 'Gut Impact',
          description: 'Likelihood of digestive discomfort for sensitive individuals',
          details: ['Sugar alcohols', 'Gums/thickeners', 'Fermentable additives']
        },
        hormonal: {
          score: 50,
          title: 'Hormonal Impact',
          description: 'Ingredients discussed in hormone-related research',
          details: ['Insulin-related effects', 'Cortisol-linked sugar patterns']
        },
        evidence: {
          confidence: 'Mixed Evidence',
          sources: '3 studies, 1 survey'
        }
      }
    },
    emulsifier: {
      name: 'Emulsifier (Polysorbate 80)',
      overallScore: 35,
      riskLevel: 'Moderate Concern',
      description: 'Based on current evidence, this ingredient may cause concern for some individuals.',
      categories: {
        bloodSugar: {
          score: 70,
          title: 'Blood Sugar Impact',
          description: 'Minimal direct blood sugar impact',
          details: ['No added sugars']
        },
        inflammation: {
          score: 25,
          title: 'Inflammation Potential',
          description: 'Linked to inflammatory responses',
          details: ['Potentially pro-inflammatory', 'Alters gut microbiome']
        },
        gut: {
          score: 40,
          title: 'Gut Impact',
          description: 'May cause digestive discomfort',
          details: ['Emulsifiers affect gut bacteria']
        },
        hormonal: {
          score: 20,
          title: 'Hormonal Impact',
          description: 'Possible endocrine effects',
          details: ['Potential estrogen-mimic properties']
        },
        evidence: {
          confidence: 'Emerging Research',
          sources: '5 studies'
        }
      }
    }
  };

  const autocompleteOptions = ['Sugar', 'Salt', 'Emulsifier', 'High Fructose Corn Syrup', 'Soy Lecithin'];

  const handleSearch = (e) => {
    const query = e.target.value;
    setSearchQuery(query);
    setShowDropdown(query.length > 0);
  };

  const selectOption = (option) => {
    setSearchQuery(option);
    setShowDropdown(false);
    handleIngredientSelect(option.toLowerCase());
  };

  const handleIngredientSelect = (ingredientKey) => {
    setIsLoading(true);
    // Simulate API call
    setTimeout(() => {
      setSelectedIngredient(mockIngredients[ingredientKey] || mockIngredients.sugar);
      setIsLoading(false);
      setSaved(false);
    }, 600);
  };

  const filteredOptions = autocompleteOptions.filter(opt =>
    opt.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const getScoreColor = (score) => {
    if (score >= 90) return '#10B981'; // Green
    if (score >= 70) return '#84CC16'; // Lime
    if (score >= 50) return '#F59E0B'; // Amber
    if (score >= 30) return '#EF9B54'; // Orange
    return '#DC2626'; // Red
  };

  const getRiskColor = (score) => {
    if (score >= 70) return '#2D7D5E'; // Green
    if (score >= 40) return '#F59E0B'; // Amber
    return '#DC2626'; // Red
  };

  return (
    <div style={styles.container}>
      {/* Navigation */}
      <nav style={styles.navigation}>
        <div style={styles.navLeft}>
          {['History', 'Insights', 'Library', 'About Us'].map(item => (
            <button key={item} style={styles.navPill}>
              {item}
            </button>
          ))}
        </div>
        <div style={styles.profileIcon}>👤</div>
      </nav>

      {/* Main Content */}
      <div style={styles.content}>
        {/* Search Bar */}
        <div style={styles.searchContainer}>
          <div style={styles.searchBarWrapper}>
            <Search size={20} color="#9CA3AF" style={{ position: 'absolute', left: 16 }} />
            <input
              type="text"
              placeholder="search for an ingredient"
              value={searchQuery}
              onChange={handleSearch}
              onFocus={() => searchQuery && setShowDropdown(true)}
              style={styles.searchInput}
            />
            <Mic size={20} color="#9CA3AF" style={{ position: 'absolute', right: 16, cursor: 'pointer' }} />

            {/* Autocomplete Dropdown */}
            {showDropdown && filteredOptions.length > 0 && (
              <div style={styles.dropdown}>
                {filteredOptions.map(option => (
                  <div
                    key={option}
                    style={styles.dropdownItem}
                    onClick={() => selectOption(option)}
                  >
                    {option}
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>

        {/* Results Section */}
        {selectedIngredient && (
          <div style={styles.resultsSection}>
            {/* Ingredient Title */}
            <div style={styles.ingredientTitleContainer}>
              <h1 style={styles.ingredientTitle}>{selectedIngredient.name}</h1>
              <button
                style={{
                  ...styles.bookmarkButton,
                  background: saved ? '#E8DCC8' : '#FFFFFF',
                }}
                onClick={() => setSaved(!saved)}
              >
                <Heart size={16} fill={saved ? '#1F2937' : 'none'} stroke="#1F2937" />
              </button>
            </div>

            {/* Loading State */}
            {isLoading && (
              <div style={styles.loadingSpinner}>
                <div style={styles.spinner}></div>
              </div>
            )}

            {!isLoading && (
              <>
                {/* Main Circular Card */}
                <div style={styles.mainCard}>
                  <div style={styles.scoreLabel}>HEALTH RISK SCORE</div>
                  <div style={{
                    ...styles.scoreNumber,
                    color: getRiskColor(selectedIngredient.overallScore)
                  }}>
                    {selectedIngredient.overallScore}
                  </div>

                  {/* Score Bar */}
                  <div style={styles.scoreBarContainer}>
                    <div style={styles.scoreBar}>
                      <div
                        style={{
                          ...styles.scoreBarFill,
                          width: `${selectedIngredient.overallScore}%`,
                          background: `linear-gradient(90deg, #F87171, #FB923C, #FBBF24, #A3E635, #34D399)`,
                        }}
                      ></div>
                    </div>
                    <div style={{
                      ...styles.scoreMarker,
                      left: `${selectedIngredient.overallScore}%`
                    }}></div>
                  </div>

                  <div style={{
                    ...styles.riskLevel,
                    color: getRiskColor(selectedIngredient.overallScore)
                  }}>
                    {selectedIngredient.riskLevel}
                  </div>

                  <p style={styles.mainDescription}>{selectedIngredient.description}</p>

                  <p style={styles.disclaimer}>
                    *this score is based on research but it should not be taken as medical advice. Consult medical professionals for help with personal health concerns.
                  </p>
                </div>

                {/* Category Breakdown */}
                <div style={styles.breakdown}>
                  {Object.entries(selectedIngredient.categories).slice(0, 4).map(([key, category]) => (
                    <div key={key} style={styles.categorySection}>
                      <h3 style={styles.categoryTitle}>{category.title}</h3>

                      <p style={styles.categoryDescription}>{category.description}</p>

                      <div style={styles.detailsList}>
                        {category.details.map((detail, idx) => (
                          <div key={idx} style={styles.detailItem}>
                            <span style={styles.bullet}>•</span>
                            <span>{detail}</span>
                          </div>
                        ))}
                      </div>

                      <div style={styles.scoreBarRow}>
                        <div style={styles.scoreBarContainer2}>
                          <div style={styles.scoreBar}>
                            <div
                              style={{
                                ...styles.scoreBarFill,
                                width: `${category.score}%`,
                                background: getScoreColor(category.score),
                              }}
                            ></div>
                          </div>
                        </div>
                        <span style={styles.scoreText}>{category.score}/100</span>
                      </div>
                    </div>
                  ))}

                  {/* Evidence Section */}
                  <div style={styles.categorySection}>
                    <h3 style={styles.categoryTitle}>Evidence Confidence</h3>
                    <p style={styles.categoryDescription}>
                      {selectedIngredient.categories.evidence.confidence}
                    </p>
                    <p style={styles.sourcesText}>
                      Sources: {selectedIngredient.categories.evidence.sources}
                    </p>
                  </div>
                </div>

                {/* CTA Button */}
                <button style={styles.primaryButton}>
                  ADD TO TODAY'S LOG
                </button>
              </>
            )}
          </div>
        )}

        {/* Empty State */}
        {!selectedIngredient && !isLoading && (
          <div style={styles.emptyState}>
            <p style={styles.emptyStateText}>Search for an ingredient to get started</p>
          </div>
        )}
      </div>
    </div>
  );
}

const styles = {
  container: {
    minHeight: '100vh',
    background: '#F5F3F0',
    fontFamily: 'Inter, -apple-system, sans-serif',
    color: '#1F2937',
  },

  // Navigation
  navigation: {
    background: '#F5F3F0',
    padding: '16px 24px',
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    borderBottom: '1px solid #E5E7EB',
  },
  navLeft: {
    display: 'flex',
    gap: '12px',
  },
  navPill: {
    background: '#E8DCC8',
    border: 'none',
    padding: '8px 16px',
    borderRadius: '9999px',
    fontSize: '16px',
    fontWeight: '500',
    cursor: 'pointer',
    transition: '200ms ease-in-out',
  },
  profileIcon: {
    fontSize: '24px',
    cursor: 'pointer',
  },

  // Search
  content: {
    maxWidth: '1200px',
    margin: '0 auto',
    padding: '24px',
  },
  searchContainer: {
    display: 'flex',
    justifyContent: 'center',
    marginBottom: '24px',
  },
  searchBarWrapper: {
    position: 'relative',
    width: '100%',
    maxWidth: '600px',
  },
  searchInput: {
    width: '100%',
    padding: '12px 16px 12px 44px',
    fontSize: '16px',
    border: '2px solid #E5E7EB',
    borderRadius: '24px',
    background: '#FFFFFF',
    outline: 'none',
    transition: '200ms ease-in-out',
    boxSizing: 'border-box',
  },
  dropdown: {
    position: 'absolute',
    top: '100%',
    left: 0,
    right: 0,
    background: '#FFFFFF',
    border: '1px solid #E5E7EB',
    borderTop: 'none',
    borderRadius: '0 0 8px 8px',
    maxHeight: '320px',
    overflowY: 'auto',
    boxShadow: '0 4px 6px rgba(0, 0, 0, 0.07)',
    zIndex: 10,
  },
  dropdownItem: {
    padding: '12px 16px',
    borderBottom: '1px solid #F3F4F6',
    cursor: 'pointer',
    transition: 'background 200ms',
    fontSize: '14px',
  },

  // Results
  resultsSection: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  ingredientTitleContainer: {
    position: 'relative',
    marginBottom: '24px',
    textAlign: 'center',
  },
  ingredientTitle: {
    fontFamily: 'Garamond, Georgia, serif',
    fontSize: '32px',
    fontWeight: '700',
    margin: '0 0 16px 0',
    color: '#1F2937',
  },
  bookmarkButton: {
    position: 'absolute',
    top: '-50px',
    right: '16px',
    width: '32px',
    height: '32px',
    border: '2px solid #1F2937',
    borderRadius: '4px',
    background: '#FFFFFF',
    cursor: 'pointer',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    transition: '200ms',
  },

  // Main Card
  mainCard: {
    width: '100%',
    maxWidth: '500px',
    aspectRatio: '1 / 1',
    background: '#F5F3F0',
    border: '3px solid #D4C5B0',
    borderRadius: '50%',
    padding: '40px',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    textAlign: 'center',
    boxShadow: '0 10px 15px rgba(0, 0, 0, 0.1)',
    marginBottom: '24px',
    boxSizing: 'border-box',
  },
  scoreLabel: {
    fontSize: '14px',
    fontWeight: '600',
    color: '#2D7D5E',
    letterSpacing: '0.05em',
    marginBottom: '8px',
  },
  scoreNumber: {
    fontFamily: 'Garamond, Georgia, serif',
    fontSize: '72px',
    fontWeight: '700',
    marginBottom: '16px',
  },
  scoreBarContainer: {
    width: '80%',
    position: 'relative',
    marginBottom: '12px',
  },
  scoreBar: {
    width: '100%',
    height: '8px',
    background: 'linear-gradient(90deg, #F87171, #FB923C, #FBBF24, #A3E635, #34D399)',
    borderRadius: '4px',
  },
  scoreBarFill: {
    height: '100%',
    borderRadius: '4px',
    transition: 'width 300ms ease-out',
  },
  scoreMarker: {
    position: 'absolute',
    top: '-8px',
    width: '2px',
    height: '24px',
    background: '#1F2937',
    transform: 'translateX(-50%)',
  },
  riskLevel: {
    fontSize: '18px',
    fontWeight: '600',
    margin: '12px 0',
  },
  mainDescription: {
    fontSize: '16px',
    color: '#4B5563',
    lineHeight: '1.6',
    margin: '16px 0',
  },
  disclaimer: {
    fontSize: '12px',
    color: '#6B7280',
    fontStyle: 'italic',
    marginTop: '12px',
    lineHeight: '1.4',
  },

  // Breakdown
  breakdown: {
    width: '100%',
    maxWidth: '600px',
    display: 'flex',
    flexDirection: 'column',
    gap: '24px',
    marginBottom: '24px',
  },
  categorySection: {
    background: '#FFFFFF',
    border: '1px solid #E5E7EB',
    borderRadius: '12px',
    padding: '20px',
    boxShadow: '0 1px 2px rgba(0, 0, 0, 0.05)',
  },
  categoryTitle: {
    fontSize: '18px',
    fontWeight: '600',
    color: '#1F2937',
    margin: '0 0 12px 0',
    paddingBottom: '12px',
    borderBottom: '2px solid #E5E7EB',
  },
  categoryDescription: {
    fontSize: '14px',
    color: '#6B7280',
    margin: '12px 0',
    lineHeight: '1.6',
  },
  detailsList: {
    display: 'flex',
    flexDirection: 'column',
    gap: '8px',
    margin: '12px 0',
  },
  detailItem: {
    fontSize: '14px',
    color: '#4B5563',
    display: 'flex',
    gap: '8px',
  },
  bullet: {
    color: '#2D7D5E',
    fontWeight: 'bold',
  },
  scoreBarRow: {
    display: 'flex',
    alignItems: 'center',
    gap: '12px',
    marginTop: '12px',
  },
  scoreBarContainer2: {
    flex: 1,
  },
  scoreText: {
    fontSize: '14px',
    fontWeight: '600',
    color: '#1F2937',
    minWidth: '60px',
    textAlign: 'right',
  },
  sourcesText: {
    fontSize: '14px',
    color: '#6B7280',
  },

  // Button
  primaryButton: {
    background: '#2D7D5E',
    color: '#FFFFFF',
    padding: '12px 32px',
    fontSize: '16px',
    fontWeight: '600',
    border: 'none',
    borderRadius: '8px',
    cursor: 'pointer',
    transition: '200ms ease-in-out',
    width: '100%',
    maxWidth: '300px',
  },

  // Loading
  loadingSpinner: {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    height: '400px',
  },
  spinner: {
    width: '40px',
    height: '40px',
    border: '4px solid #E5E7EB',
    borderTop: '4px solid #2D7D5E',
    borderRadius: '50%',
    animation: 'spin 1s linear infinite',
  },

  // Empty State
  emptyState: {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    height: '400px',
  },
  emptyStateText: {
    fontSize: '18px',
    color: '#6B7280',
  },
};

// Add animation to document
const style = document.createElement('style');
style.textContent = `
  @keyframes spin {
    to { transform: rotate(360deg); }
  }
`;
document.head.appendChild(style);
